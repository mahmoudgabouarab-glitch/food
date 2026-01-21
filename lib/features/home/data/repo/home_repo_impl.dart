import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food/core/errors/failure.dart';
import 'package:food/core/network/api_service.dart';
import 'package:food/features/home/data/model/category_model/category_model.dart';
import 'package:food/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServise _api;

  HomeRepoImpl(this._api);
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
}
