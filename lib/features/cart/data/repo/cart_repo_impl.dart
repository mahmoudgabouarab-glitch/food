import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food/core/errors/failure.dart';
import 'package:food/core/network/api_service.dart';
import 'package:food/features/cart/data/model/get_cart_model/get_cart_response.dart';
import 'package:food/features/cart/data/repo/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final ApiServise _api;

  CartRepoImpl(this._api);
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

  @override
  Future<Either<Failure, GetCartResponse>> deleteCart({
    required String id,
  }) async {
    try {
      var data = await _api.delete(endpoint: "cart/remove/$id");
      final user = GetCartResponse.fromJson(data);
      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServiseFailure.fromdioException(e));
      }
      return Left(ServiseFailure(e.toString()));
    }
  }
}
