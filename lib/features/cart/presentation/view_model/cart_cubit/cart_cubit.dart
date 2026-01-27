import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/cart/data/model/get_cart_model/get_cart_response.dart';
import 'package:food/features/cart/data/repo/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._repo) : super(CartInitial());
  final CartRepo _repo;

  Future<void> getCart() async {
    emit(CartLoading());
    final result = await _repo.getCart();
    result.fold(
      (failure) => emit(CartFailure(failure.errormessage)),
      (success) => emit(CartSuccess(success)),
    );
  }
}
