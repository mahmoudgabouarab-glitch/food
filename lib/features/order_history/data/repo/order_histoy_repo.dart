import 'package:dartz/dartz.dart';
import 'package:food/core/errors/failure.dart';
import 'package:food/features/order_history/data/model/order/order.history.model.dart';

abstract class OrderHistoryRepo {
  Future<Either<Failure, OrderHistoryModel>> getOrderHistory();
}
