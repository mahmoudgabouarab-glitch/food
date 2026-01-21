import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food/core/errors/failure.dart';
import 'package:food/core/network/api_service.dart';
import 'package:food/features/auth/data/models/auth_model.dart';
import 'package:food/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiServise _api;

  AuthRepoImpl(this._api);
  @override
  Future<Either<Failure, AuthModel>> postLogin({
    required String email,
    required String password,
  }) async {
    try {
      var data = await _api.post(
        endpoint: "login",
        data: {"email": email, "password": password},
      );
      final user = AuthModel.fromJson(data);
      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServiseFailure.fromdioException(e));
      }
      return Left(ServiseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> postSignup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      var data = await _api.post(
        endpoint: "register",
        data: {"email": email, "password": password, "name": name},
      );
      final user = AuthModel.fromJson(data);
      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServiseFailure.fromdioException(e));
      }
      return Left(ServiseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> getProfile() async {
    try {
      var data = await _api.get(endpoint: "profile");
      final user = AuthModel.fromJson(data);
      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServiseFailure.fromdioException(e));
      }
      return Left(ServiseFailure(e.toString()));
    }
  }
}
