import 'package:dartz/dartz.dart';
import 'package:food/core/errors/failure.dart';
import 'package:food/features/home/data/model/category_model/category_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, CategoryModel>> getCategory();
}
