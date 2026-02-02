import 'package:dartz/dartz.dart';
import 'package:food/core/errors/failure.dart';
import 'package:food/features/auth/data/models/auth_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthModel>> postLogin({
    required String email,
    required String password,
  });
  Future<Either<Failure, AuthModel>> postSignup({
    required String name,
    required String email,
    required String password,
    required String phone,
    required XFile? image,
  });
  Future<Either<Failure, AuthModel>> postlogout();

}
