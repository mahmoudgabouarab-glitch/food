import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/widgets/custom_text_filed.dart';
import 'package:food/features/auth/presentation/view_model/login/login_cubit.dart';

class LoginTextFiled extends StatelessWidget {
  const LoginTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Form(
      key: cubit.loginKey,
      child: Column(
        children: [
          spaceH(100),
          CustomTextFormFiled(
            hint: 'Email',
            keybordtype: TextInputType.emailAddress,
            controller: cubit.emailController,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Email is required';
              }
              return null;
            },
          ),
          spaceH(16),
          CustomTextFormFiled(
            keybordtype: TextInputType.visiblePassword,
            controller: cubit.passwordController,
            hint: 'Password',
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
            obscureText: true,
          ),
          spaceH(32),
        ],
      ),
    );
  }
}
