import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/home/data/model/details_model/toppings_model.dart';
import 'package:food/features/home/data/repo/home_repo.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this._repo) : super(DetailsState());
  final HomeRepo _repo;

  Future<void> getToppings() async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _repo.getToppings();
    result.fold(
      (failure) =>
          emit(state.copyWith(error: failure.errormessage, isLoading: false)),
      (success) => emit(state.copyWith(toppings: success, isLoading: false)),
    );
  }

  Future<void> getSideOptions() async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await _repo.getSideOptions();
    result.fold(
      (failure) =>
          emit(state.copyWith(error: failure.errormessage, isLoading: false)),
      (success) => emit(state.copyWith(sideOptions: success, isLoading: false)),
    );
  }
}
