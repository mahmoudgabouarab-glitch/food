import 'package:dartz/dartz.dart';
import 'package:food/core/errors/failure.dart';
import 'package:food/features/settings/data/model/profile_model.dart';
import 'package:image_cropper/image_cropper.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileModel>> getProfile();
  Future<Either<Failure, ProfileModel>> postUpdataProfile({
    String? name,
    String? email,
    String? address,
    String? visa,
    CroppedFile? image,
  });
}
