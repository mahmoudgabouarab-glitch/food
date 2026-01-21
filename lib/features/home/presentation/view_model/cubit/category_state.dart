part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final CategoryModel categoryModel;

  const CategorySuccess(this.categoryModel);
}

final class CategoryFailure extends CategoryState {
  final String err;

  const CategoryFailure(this.err);
}
