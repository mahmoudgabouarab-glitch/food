part of 'fav_products_cubit.dart';

sealed class FavProductsState extends Equatable {
  const FavProductsState();

  @override
  List<Object> get props => [];
}

final class FavProductsInitial extends FavProductsState {}

final class FavProductsLoading extends FavProductsState {
  final int productId;
  const FavProductsLoading({required this.productId});
}

final class FavProductsSuccess extends FavProductsState {
  final int productId;
  final bool isFavorite;
  final String message;
  const FavProductsSuccess({
    required this.productId,
    required this.isFavorite,
    required this.message,
  });

  @override
  List<Object> get props => [productId, isFavorite, message];
}

final class FavProductsFailure extends FavProductsState {
  final int productId;
  final String err;
  const FavProductsFailure({required this.err, required this.productId});

  @override
  List<Object> get props => [err];
}

final class FavProductsCached extends FavProductsState {
  final Set<int> favorites;

  const FavProductsCached(this.favorites);

  @override
  List<Object> get props => [favorites];
}
