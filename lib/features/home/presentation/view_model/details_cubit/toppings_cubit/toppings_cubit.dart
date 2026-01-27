// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:food/features/home/data/model/details_model/toppings_model.dart';
// import 'package:food/features/home/data/repo/home_repo.dart';

// part 'toppings_state.dart';

// class ToppingsCubit extends Cubit<ToppingsState> {
//   ToppingsCubit(this._repo) : super(ToppingsInitial());
//   final HomeRepo _repo;

//   Future<void> getToppings() async {
//     emit(ToppingsLoading());
//     final result = await _repo.getToppings();
//     result.fold(
//       (failure) => emit(ToppingsFailure(failure.errormessage)),
//       (success) => emit(ToppingsSuccess(success)),
//     );
//   }

//   void selectToppings(int index) {
//     if (state is! ToppingsSuccess) return;
//     final currentState = state as ToppingsSuccess;
//     final selected = Set<int>.from(currentState.selectedIndexes);
//     selected.contains(index) ? selected.remove(index) : selected.add(index);

//     emit(
//       ToppingsSuccess(currentState.toppingsModel, selectedIndexes: selected),
//     );
//   }

//   List<int> get selectedToppingIds {
//     if (state is! ToppingsSuccess) return [];

//     final currentState = state as ToppingsSuccess;
//     final toppings = currentState.toppingsModel.data;

//     return currentState.selectedIndexes.map((i) => toppings[i].id).toList();
//   }
// }
