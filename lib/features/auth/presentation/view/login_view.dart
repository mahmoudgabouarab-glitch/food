import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/servise_locator.dart';
import 'package:food/features/auth/data/repo/auth_repo_impl.dart';
import 'package:food/features/auth/presentation/view/widgets/login/login_body.dart';
import 'package:food/features/auth/presentation/view_model/login/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepoImpl>()),
      child: const LoginBody(),
    );
  }
}
