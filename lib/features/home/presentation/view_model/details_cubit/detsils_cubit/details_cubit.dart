import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/home/data/repo/home_repo.dart';
import 'package:food/features/home/presentation/view_model/details_cubit/detsils_cubit/details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this._repo) : super(const DetailsState());
  final HomeRepo _repo;
  //get details
  Future<void> getDetails() async {
    emit(state.copyWith(isLoading: true, err: null));

    final toppingsRes = await _repo.getToppings();
    final sidesRes = await _repo.getSideOptions();

    toppingsRes.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, err: failure.errormessage));
      },
      (toppings) {
        emit(state.copyWith(toppingsModel: toppings));
      },
    );

    sidesRes.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, err: failure.errormessage));
      },
      (sides) {
        emit(state.copyWith(sideOptionsModel: sides));
      },
    );

    emit(state.copyWith(isLoading: false));
  }

  //change spicy
  void changeSpicy(double value) {
    emit(state.copyWith(spicy: value));
  }

  // toppings select
  void selectTopping(int index) {
    final updated = Set<int>.from(state.selectedtoppings);
    updated.contains(index) ? updated.remove(index) : updated.add(index);

    emit(state.copyWith(selectedtoppings: updated));
  }

  // sides select
  void selectSideOption(int index) {
    final updated = Set<int>.from(state.selectedsideOptions);
    updated.contains(index) ? updated.remove(index) : updated.add(index);

    emit(state.copyWith(selectedsideOptions: updated));
  }

  //selected Topping Id
  List<int> get selectedToppingIds {
    if (state.toppingsModel == null) return [];
    final list = state.toppingsModel!.data;

    return state.selectedtoppings.map((i) => list[i].id).toList();
  }

  // selected Side Option Id
  List<int> get selectedSideOptionIds {
    if (state.sideOptionsModel == null) return [];
    final list = state.sideOptionsModel!.data;

    return state.selectedsideOptions.map((i) => list[i].id).toList();
  }
}
