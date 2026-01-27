import 'package:dartz/dartz.dart';
import 'package:food/core/errors/failure.dart';
import 'package:food/features/home/data/model/cart/add_to_cart_request.dart';
import 'package:food/features/home/data/model/cart/add_to_cart_response.dart';
import 'package:food/features/cart/data/model/get_cart_model/get_cart_response.dart';
import 'package:food/features/home/data/model/category_model/category_model.dart';
import 'package:food/features/home/data/model/details_model/side_options_model.dart';
import 'package:food/features/home/data/model/details_model/toppings_model.dart';
import 'package:food/features/home/data/model/products_model/products_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, CategoryModel>> getCategory();
  Future<Either<Failure, ProductsModel>> getProducts();
  Future<Either<Failure, ToppingsModel>> getToppings();
  Future<Either<Failure, SideOptionsModel>> getSideOptions();
  Future<Either<Failure, GetCartResponse>> getCart();
  Future<Either<Failure, AddToCartResponse>> postAddToCart(
    AddToCartRequest request,
  );
}
