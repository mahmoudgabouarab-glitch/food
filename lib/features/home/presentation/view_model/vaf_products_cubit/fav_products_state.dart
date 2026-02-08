part of 'fav_products_cubit.dart';

sealed class FavProductsState extends Equatable {
  const FavProductsState();

  @override
  List<Object> get props => [];
}

final class FavProductsInitial extends FavProductsState {}

final class FavProductsLoading extends FavProductsState {
  final int productId;
  const FavProductsLoading(this.productId);
}

final class FavProductsSuccess extends FavProductsState {
  final String message;
  const FavProductsSuccess(this.message);

  @override
  List<Object> get props => [message];
}

final class FavProductsFailure extends FavProductsState {
  final String err;
  const FavProductsFailure(this.err);

  @override
  List<Object> get props => [err];
}

final class GetFavProductsSuccess extends FavProductsState {
  final FavProductsResponse favProductsModel;
  const GetFavProductsSuccess(this.favProductsModel);

  @override
  List<Object> get props => [favProductsModel];
}

final class GetFavProductsFailure extends FavProductsState {
  final String err;
  const GetFavProductsFailure(this.err);

  @override
  List<Object> get props => [err];
}

