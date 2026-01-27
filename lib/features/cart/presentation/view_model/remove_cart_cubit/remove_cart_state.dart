part of 'remove_cart_cubit.dart';

sealed class RemoveCartState extends Equatable {
  const RemoveCartState();

  @override
  List<Object> get props => [];
}

final class RemoveCartInitial extends RemoveCartState {}

final class RemoveCartLoading extends RemoveCartState {}

final class RemoveCartSuccess extends RemoveCartState {
  final GetCartResponse deleteCartResponse;
  const RemoveCartSuccess(this.deleteCartResponse);
}

final class RemoveCartFailure extends RemoveCartState {
  final String errormessage;
  const RemoveCartFailure(this.errormessage);
}
