part of 'search_products_cubit.dart';

sealed class SearchProductsState extends Equatable {
  const SearchProductsState();

  @override
  List<Object> get props => [];
}

final class SearchProductsInitial extends SearchProductsState {}

final class SearchProductsLoading extends SearchProductsState {}

final class SearchProductsSuccess extends SearchProductsState {
  final ProductsModel listOfProducts;
  const SearchProductsSuccess(this.listOfProducts);
  @override
  List<Object> get props => [listOfProducts];
}

final class SearchProductsFailure extends SearchProductsState {
  final String err;
  const SearchProductsFailure(this.err);
  @override
  List<Object> get props => [err];
}
