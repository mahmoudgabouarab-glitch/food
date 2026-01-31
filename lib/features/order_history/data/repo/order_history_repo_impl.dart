import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food/core/errors/failure.dart';
import 'package:food/core/network/api_service.dart';
import 'package:food/features/order_history/data/model/order/order.history.model.dart';
import 'package:food/features/order_history/data/repo/order_histoy_repo.dart';

class OrderHistoryRepoImpl implements OrderHistoryRepo {
  final ApiServise _api;

  OrderHistoryRepoImpl(this._api);
  @override
  Future<Either<Failure, OrderHistoryModel>> getOrderHistory() async {
    try {
      final data = await _api.get(endpoint: "orders");

      return Right(OrderHistoryModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServiseFailure.fromdioException(e));
      }
      return Left(ServiseFailure(e.toString()));
    }
  }
}
