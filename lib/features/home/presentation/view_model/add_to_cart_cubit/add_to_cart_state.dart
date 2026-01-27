part of 'add_to_cart_cubit.dart';

sealed class AddToCartState extends Equatable {
  const AddToCartState();

  @override
  List<Object> get props => [];
}

final class AddToCartInitial extends AddToCartState {}

final class AddToCartLoading extends AddToCartState {}

final class AddToCartSuccess extends AddToCartState 
{
  final AddToCartModel addToCartModel;
  const AddToCartSuccess(this.addToCartModel);
}

final class AddToCartFailure extends AddToCartState {
  final String err;
  const AddToCartFailure(this.err);
}
