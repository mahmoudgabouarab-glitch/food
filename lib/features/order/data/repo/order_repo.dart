import 'package:dartz/dartz.dart';
import 'package:food/core/errors/failure.dart';
import 'package:food/features/order/data/model/order_request.dart';
import 'package:food/features/order/data/model/order_response.dart';

abstract class OrderRepo {
  Future<Either<Failure, OrderResponse>> postOrder(OrderRequest request);
}
