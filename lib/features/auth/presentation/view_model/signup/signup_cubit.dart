import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/auth/data/models/auth_model.dart';
import 'package:food/features/auth/data/repo/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._repo) : super(SignupInitial());
  final AuthRepo _repo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> signupKey = GlobalKey<FormState>();
  Future<void> postSignup() async {
    emit(SignupLoading());
    var data = await _repo.postSignup(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    data.fold(
      (failure) {
        emit(SignupFailure(failure.errormessage));
        print(failure);
      },
      (success) {
        emit(SignupSuccess(success));
      },
    );
  }
}
