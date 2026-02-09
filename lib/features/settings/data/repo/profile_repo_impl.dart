import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food/core/errors/failure.dart';
import 'package:food/core/network/api_service.dart';
import 'package:food/features/settings/data/model/profile_model.dart';
import 'package:food/features/settings/data/repo/profile_repo.dart';
import 'package:image_cropper/image_cropper.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ApiServise _api;

  ProfileRepoImpl(this._api);

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
    CroppedFile? image,
  }) async {
    try {
      MultipartFile? file;
      if (image != null) {
        file = await MultipartFile.fromFile(image.path);
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
