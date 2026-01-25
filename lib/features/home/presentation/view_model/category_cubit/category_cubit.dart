import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/home/data/model/category_model/category_model.dart';
import 'package:food/features/home/data/repo/home_repo.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._repo) : super(CategoryInitial());
  final HomeRepo _repo;

  Future<void> getCategory() async {
    emit(CategoryLoading());
    var data = await _repo.getCategory();
    data.fold(
      (failure) {
        emit(CategoryFailure(failure.errormessage));
      },
      (success) {
        emit(CategorySuccess(success));
      },
    );
  }
}
