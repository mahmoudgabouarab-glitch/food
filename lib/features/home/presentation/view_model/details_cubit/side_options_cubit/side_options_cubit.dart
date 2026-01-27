import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/home/data/model/details_model/side_options_model.dart';
import 'package:food/features/home/data/repo/home_repo.dart';

part 'side_options_state.dart';

class SideOptionsCubit extends Cubit<SideOptionsState> {
  SideOptionsCubit(this._repo) : super(SideOptionsInitial());
  final HomeRepo _repo;
  Future<void> getSideOptions() async {
    emit(SideOptionsLoading());
    final result = await _repo.getSideOptions();
    result.fold(
      (failure) => emit(SideOptionsFailure(failure.errormessage)),
      (success) => emit(SideOptionsSuccess(success)),
    );
  }
}
