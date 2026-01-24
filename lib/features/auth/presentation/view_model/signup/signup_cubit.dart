import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/cache_helper.dart';
import 'package:food/core/network/cache_keys.dart';
import 'package:food/features/auth/data/models/auth_model.dart';
import 'package:food/features/auth/data/repo/auth_repo.dart';
import 'package:image_picker/image_picker.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._repo) : super(SignupInitial());
  final AuthRepo _repo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> signupKey = GlobalKey<FormState>();
  XFile? selectedImage;

  void pickImage(XFile? file) {
    if (file == null) return;
    selectedImage = file;
    emit(ImageSuccess(file));
  }

  Future<void> postSignup() async {
    emit(SignupLoading());
    var data = await _repo.postSignup(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      phone: phoneController.text,
      image: selectedImage,
    );
    data.fold(
      (failure) {
        emit(SignupFailure(failure.errormessage));
      },
      (success) async {
        await CacheHelper.saveData(
          key: CacheKeys.token,
          value: success.data.token,
        );
        emit(SignupSuccess(success));
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
