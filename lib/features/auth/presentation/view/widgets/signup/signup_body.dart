import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/core/widgets/custom_text_filed.dart';
import 'package:food/core/widgets/app_text_button.dart';
import 'package:food/features/auth/presentation/view/widgets/signup/signup_bloc.dart';
import 'package:food/features/auth/presentation/view/widgets/signup/signup_text_botton_login.dart';
import 'package:food/features/auth/presentation/view_model/signup/signup_cubit.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
            child: Form(
              key: cubit.signupKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create Account', style: Styles.s32_400),
                  SizedBox(height: 8.h),
                  Text(
                    'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                    style: Styles.s16_500,
                  ),
                  SizedBox(height: 100.h),
                  CustomTextFormFiled(
                    hint: 'Name',
                    controller: cubit.nameController,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormFiled(
                    hint: 'Email',
                    controller: cubit.emailController,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormFiled(
                    hint: 'Password',
                    controller: context.read<SignupCubit>().passwordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 32.h),
                  AppButton(
                    buttonText: 'Sign Up',
                    textStyle: Styles.s16_500.copyWith(
                      color: const Color(0xffffffff),
                    ),
                    onPressed: () => cubit.postSignup(),
                  ),
                  SizedBox(height: 20.h),
                  const SignupTextBottonLogin(),
                  SizedBox(height: 40.h),
                  Center(
                    child: SvgPicture.asset(
                      "assets/svg/Hungry_.svg",
                      height: 20.h,
                    ),
                  ),
                  const SignupBloc(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
