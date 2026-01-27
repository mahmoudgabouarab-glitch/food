import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food/core/errors/failure.dart';
import 'package:food/core/network/api_service.dart';
import 'package:food/features/home/data/model/cart/add_to_cart_request.dart';
import 'package:food/features/home/data/model/cart/add_to_cart_response.dart';
import 'package:food/features/cart/data/model/get_cart_model/get_cart_response.dart';
import 'package:food/features/home/data/model/category_model/category_model.dart';
import 'package:food/features/home/data/model/details_model/side_options_model.dart';
import 'package:food/features/home/data/model/details_model/toppings_model.dart';
import 'package:food/features/home/data/model/products_model/products_model.dart';
import 'package:food/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServise _api;

  HomeRepoImpl(this._api);
  //getCategory
  @override
  Future<Either<Failure, CategoryModel>> getCategory() async {
    try {
      var data = await _api.get(endpoint: "categories");
      final user = CategoryModel.fromJson(data);
      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServiseFailure.fromdioException(e));
      }
      return Left(ServiseFailure(e.toString()));
    }
  }

  //getProducts
  @override
  Future<Either<Failure, ProductsModel>> getProducts() async {
    try {
      var data = await _api.get(endpoint: "products");
      final user = ProductsModel.fromJson(data);
      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServiseFailure.fromdioException(e));
      }
      return Left(ServiseFailure(e.toString()));
    }
  }

  //getToppings
  @override
  Future<Either<Failure, ToppingsModel>> getToppings() async {
    try {
      var data = await _api.get(endpoint: "toppings");
      final user = ToppingsModel.fromJson(data);
      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServiseFailure.fromdioException(e));
      }
      return Left(ServiseFailure(e.toString()));
    }
  }

  //getSideOptions
  @override
  Future<Either<Failure, SideOptionsModel>> getSideOptions() async {
    try {
      var data = await _api.get(endpoint: "side-options");
      final user = SideOptionsModel.fromJson(data);
      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServiseFailure.fromdioException(e));
      }
      return Left(ServiseFailure(e.toString()));
    }
  }

  //getCart
  @override
  Future<Either<Failure, GetCartResponse>> getCart() async {
    try {
      var data = await _api.get(endpoint: "cart");
      final user = GetCartResponse.fromJson(data);
      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServiseFailure.fromdioException(e));
      }
      return Left(ServiseFailure(e.toString()));
    }
  }

  //postAddToCart
  @override
  Future<Either<Failure, AddToCartResponse>> postAddToCart(
    AddToCartRequest request,
  ) async {
    try {
      final data = await _api.post(
        endpoint: "cart/add",
        data: request.toJson(),
      );

      return Right(AddToCartResponse.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServiseFailure.fromdioException(e));
      }
      return Left(ServiseFailure(e.toString()));
    }
  }
}
