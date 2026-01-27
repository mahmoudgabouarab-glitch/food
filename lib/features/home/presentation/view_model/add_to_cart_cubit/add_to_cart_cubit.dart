import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/home/data/model/cart/add_to_cart_request.dart';
import 'package:food/features/home/data/repo/home_repo.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this._repo) : super(AddToCartInitial());
  final HomeRepo _repo;

  Future<void> addToCart(AddToCartItem item) async {
    emit(AddToCartLoading());

    final result = await _repo.postAddToCart(AddToCartRequest(items: [item]));

    result.fold(
      (failure) => emit(AddToCartFailure(failure.errormessage)),
      (success) => emit(AddToCartSuccess(success.message)),
    );
  }
}
