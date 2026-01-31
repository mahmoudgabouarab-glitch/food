import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food/core/errors/failure.dart';
import 'package:food/core/network/api_service.dart';
import 'package:food/features/order/data/model/order_request.dart';
import 'package:food/features/order/data/model/order_response.dart';
import 'package:food/features/order/data/repo/order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  final ApiServise _api;

  OrderRepoImpl(this._api);
  @override
  Future<Either<Failure, OrderResponse>> postOrder(OrderRequest request) async {
    try {
      final data = await _api.post(endpoint: "orders", data: request.toJson());

      return Right(OrderResponse.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServiseFailure.fromdioException(e));
      }
      return Left(ServiseFailure(e.toString()));
    }
  }
}
