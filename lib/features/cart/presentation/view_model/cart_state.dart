part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final GetCartResponse getCartResponse;
  const CartSuccess(this.getCartResponse);
  @override
  List<Object> get props => [getCartResponse];
}

final class CartFailure extends CartState {
  final String err;
  const CartFailure(this.err);
  @override
  List<Object> get props => [err];
}
