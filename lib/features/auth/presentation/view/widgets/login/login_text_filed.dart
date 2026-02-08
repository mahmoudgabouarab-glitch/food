import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/widgets/custom_text_filed.dart';
import 'package:food/features/auth/presentation/view_model/login/login_cubit.dart';
import 'package:food/generated/locale_keys.g.dart';

class LoginTextFiled extends StatelessWidget {
  const LoginTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Form(
      key: cubit.loginKey,
      child: Column(
        children: [
          spaceH(30),
          CustomTextFormFiled(
            prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
            hint: LocaleKeys.email.tr(),
            keybordtype: TextInputType.emailAddress,
            controller: cubit.emailController,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return LocaleKeys.email_required.tr();
              }
              return null;
            },
          ),
          spaceH(16),
          CustomTextFormFiled(
            prefixIcon: const Icon(Icons.lock, color: Colors.grey),
            keybordtype: TextInputType.visiblePassword,
            controller: cubit.passwordController,
            hint: LocaleKeys.password.tr(),
            validator: (val) {
              if (val == null || val.isEmpty) {
                return LocaleKeys.password_required.tr();
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
