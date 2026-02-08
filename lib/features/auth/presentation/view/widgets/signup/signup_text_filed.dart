import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/widgets/custom_text_filed.dart';
import 'package:food/features/auth/presentation/view_model/signup/signup_cubit.dart';
import 'package:food/generated/locale_keys.g.dart';

class SignupTextFiled extends StatelessWidget {
  const SignupTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Form(
      key: cubit.signupKey,
      child: Column(
        children: [
          spaceH(15),
          CustomTextFormFiled(
            prefixIcon: const Icon(Icons.person, color: Colors.grey),
            hint: LocaleKeys.name.tr(),
            controller: cubit.nameController,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return LocaleKeys.name_required.tr();
              }
              return null;
            },
          ),
          spaceH(16),
          CustomTextFormFiled(
            prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
            hint: LocaleKeys.email.tr(),
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
            prefixIcon: const Icon(Icons.phone, color: Colors.grey),
            hint: LocaleKeys.phone.tr(),
            controller: cubit.phoneController,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return LocaleKeys.phone_required.tr();
              }
              return null;
            },
          ),
          spaceH(16),
          CustomTextFormFiled(
            prefixIcon: const Icon(Icons.lock, color: Colors.grey),
            hint: LocaleKeys.password.tr(),
            controller: context.read<SignupCubit>().passwordController,
            obscureText: true,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return LocaleKeys.password_required.tr();
              }
              return null;
            },
          ),
          spaceH(32),
        ],
      ),
    );
  }
}
