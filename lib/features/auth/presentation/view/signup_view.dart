import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/servise_locator.dart';
import 'package:food/features/auth/data/repo/auth_repo_impl.dart';
import 'package:food/features/auth/presentation/view/widgets/signup/signup_body.dart';
import 'package:food/features/auth/presentation/view_model/signup/signup_cubit.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepoImpl>()),
      child: const SignupBody(),
    );
  }
}
