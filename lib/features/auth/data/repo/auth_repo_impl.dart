import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food/core/errors/failure.dart';
import 'package:food/core/network/api_service.dart';
import 'package:food/features/auth/data/models/auth_model.dart';
import 'package:food/features/auth/data/models/profile_model.dart';
import 'package:food/features/auth/data/repo/auth_repo.dart';
import 'package:image_picker/image_picker.dart';

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
    required XFile? image,
  }) async {
    try {
      MultipartFile? file;
      if (image != null) {
        file = await MultipartFile.fromFile(image.path, filename: image.name);
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

  // Profile
  @override
  Future<Either<Failure, ProfileModel>> getProfile() async {
    try {
      var data = await _api.get(endpoint: "profile");
      final user = ProfileModel.fromJson(data);
      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServiseFailure.fromdioException(e));
      }
      return Left(ServiseFailure(e.toString()));
    }
  }

  // Update Profile
  @override
  Future<Either<Failure, ProfileModel>> postUpdataProfile({
    String? name,
    String? email,
    String? address,
    String? visa,
    XFile? image,
  }) async {
    try {
      MultipartFile? file;
      if (image != null) {
        file = await MultipartFile.fromFile(image.path, filename: image.name);
      }
      var data = await _api.post(
        endpoint: "update-profile",
        data: {
          "name": ?name,
          "email": ?email,
          "address": ?address,
          "Visa": ?visa,
          "image": ?file,
        },
      );
      final user = ProfileModel.fromJson(data);
      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServiseFailure.fromdioException(e));
      }
      return Left(ServiseFailure(e.toString()));
    }
  }
}
