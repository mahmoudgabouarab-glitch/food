import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/widgets/custom_text_filed.dart';
import 'package:food/features/auth/presentation/view_model/signup/signup_cubit.dart';

class SignupTextFiled extends StatelessWidget {
  const SignupTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Column(
      children: [
        SizedBox(height: 15.h),
        CustomTextFormFiled(
          hint: 'Name',
          controller: cubit.nameController,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Name is required';
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
        CustomTextFormFiled(
          hint: 'Email',
          controller: cubit.emailController,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Email is required';
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
        CustomTextFormFiled(
          hint: 'phone',
          controller: cubit.phoneController,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'phone is required';
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
        CustomTextFormFiled(
          hint: 'Password',
          controller: context.read<SignupCubit>().passwordController,
          obscureText: true,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Password is required';
            }
            return null;
          },
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}
