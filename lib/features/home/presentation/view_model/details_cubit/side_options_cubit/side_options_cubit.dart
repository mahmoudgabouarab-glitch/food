import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/home/data/model/details_model/side_options_model.dart';
import 'package:food/features/home/data/repo/home_repo.dart';

part 'side_options_state.dart';

class SideOptionsCubit extends Cubit<SideOptionsState> {
  SideOptionsCubit(this._repo) : super(SideOptionsInitial());
  final HomeRepo _repo;
  Set<int>? selectSideOptionsToAddCart;
  Future<void> getSideOptions() async {
    emit(SideOptionsLoading());
    final result = await _repo.getSideOptions();
    result.fold(
      (failure) => emit(SideOptionsFailure(failure.errormessage)),
      (success) => emit(SideOptionsSuccess(success)),
    );
  }

  void selectSideOptions(int index) {
    if (state is! SideOptionsSuccess) return;
    final currentState = state as SideOptionsSuccess;
    final selected = Set<int>.from(currentState.selectedIndexes);
    selected.contains(index) ? selected.remove(index) : selected.add(index);
    selectSideOptionsToAddCart = selected;
    emit(
      SideOptionsSuccess(
        currentState.sideOptionsModel,
        selectedIndexes: selected,
      ),
    );
  }

  List<int> get selectedsideOptionsIds {
    if (state is! SideOptionsSuccess) return [];

    final currentState = state as SideOptionsSuccess;
    final sideOptions = currentState.sideOptionsModel.data;

    return currentState.selectedIndexes.map((i) => sideOptions[i].id).toList();
  }
}
