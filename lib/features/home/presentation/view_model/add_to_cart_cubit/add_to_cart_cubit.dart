import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/home/data/model/add_to_cart_model.dart';
import 'package:food/features/home/data/repo/home_repo.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this._repo) : super(AddToCartInitial());
  final HomeRepo _repo;

  Future<void> addToCart({
    required int productid,
    required int quantity,
    required num spicy,
    required List<int> toppings,
    required List<int> sideoptions,
  }) async {
    emit(AddToCartLoading());
    final result = await _repo.postAddToCart(
      productid: productid,
      quantity: quantity,
      spicy: spicy,
      toppings: toppings,
      sideoptions: sideoptions,
    );
    result.fold(
      (failure) => emit(AddToCartFailure(failure.errormessage)),
      (success) => emit(AddToCartSuccess(success)),
    );
  }
}
