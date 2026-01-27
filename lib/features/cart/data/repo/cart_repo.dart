import 'package:dartz/dartz.dart';
import 'package:food/core/errors/failure.dart';
import 'package:food/features/cart/data/model/get_cart_model/get_cart_response.dart';

abstract class CartRepo {
  Future<Either<Failure, GetCartResponse>> getCart();
  Future<Either<Failure, GetCartResponse>> deleteCart(
      {required String id}
  );
}
