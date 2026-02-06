import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food/core/errors/failure.dart';
import 'package:food/core/network/api_service.dart';
import 'package:food/features/auth/data/models/auth_model.dart';
import 'package:food/features/auth/data/repo/auth_repo.dart';
import 'package:image_cropper/image_cropper.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiServise _api;

  AuthRepoImpl(this._api);
  // Login
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

  // Register
  @override
  Future<Either<Failure, AuthModel>> postSignup({
    required String name,
    required String email,
    required String password,
    required String phone,
    required CroppedFile? image,
  }) async {
    try {
      MultipartFile? file;
      if (image != null) {
        file = await MultipartFile.fromFile(image.path);
      }
      var data = await _api.post(
        endpoint: "register",
        data: {
          "email": email,
          "password": password,
          "name": name,
          "phone": phone,
          "image": file,
        },
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

  // Logout
  @override
  Future<Either<Failure, AuthModel>> postlogout() async {
    try {
      var data = await _api.post(endpoint: "logout");
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
