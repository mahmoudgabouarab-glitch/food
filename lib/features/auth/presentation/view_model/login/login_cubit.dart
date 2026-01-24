import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/cache_helper.dart';
import 'package:food/core/network/cache_keys.dart';
import 'package:food/features/auth/data/models/auth_model.dart';
import 'package:food/features/auth/data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._repo) : super(LoginInitial());
  final AuthRepo _repo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  Future<void> postLogIn() async {
    emit(LoginLoading());
    var data = await _repo.postLogin(
      email: emailController.text,
      password: passwordController.text,
    );
    data.fold(
      (failure) {
        emit(LoginFailure(failure.errormessage));
      },
      (success) async {
        await CacheHelper.saveData(
          key: CacheKeys.token,
          value: success.data.token,
        );
        emit(LoginSuccess(success));
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
