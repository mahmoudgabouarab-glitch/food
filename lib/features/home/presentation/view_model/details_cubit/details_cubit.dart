import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/home/data/model/details_model/toppings_model.dart';
import 'package:food/features/home/data/repo/home_repo.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this._repo) : super(DetailsInitial());
  final HomeRepo _repo;

  Future<void> getToppings() async {
    emit(DetailsLoading());
    final result = await _repo.getToppings();
    result.fold(
      (failure) => emit(DetailsFailure(failure.errormessage)),
      (success) => emit(DetailsSuccess(success)),
    );
  }

  Future<void> getSideOptions() async {
    final result = await _repo.getSideOptions();
    result.fold(
      (failure) => emit(SideOptionsFailure(failure.errormessage)),
      (success) => emit(SideOptionsSuccess(success)),
    );
  }
}
