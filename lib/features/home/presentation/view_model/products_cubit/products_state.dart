part of 'products_cubit.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final ProductsModel productsModel;

  const ProductsSuccess(this.productsModel);
  @override
  List<Object> get props => [productsModel];
}

final class ProductsFailure extends ProductsState {
  final String err;

  const ProductsFailure(this.err);
  @override
  List<Object> get props => [err];
}
