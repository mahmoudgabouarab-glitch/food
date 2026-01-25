import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/home/data/model/products_model/products_model.dart';
import 'package:food/features/home/data/repo/home_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._repo) : super(ProductsInitial());
  final HomeRepo _repo;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    var data = await _repo.getProducts();
    data.fold(
      (failure) {
        emit(ProductsFailure(failure.errormessage));
      },
      (success) {
        emit(ProductsSuccess(success));
      },
    );
  }
}
