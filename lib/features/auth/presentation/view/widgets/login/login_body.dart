import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/auth/presentation/view/widgets/login/login_cubit.dart';
import 'package:food/features/auth/presentation/view_model/login/login_cubit.dart';
import 'package:food/features/auth/presentation/view/widgets/login/login_text_button_signup.dart';
import 'package:food/features/auth/presentation/view/widgets/login/login_text_filed.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/core/widgets/app_text_button.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back", style: Styles.s32_400),
                SizedBox(height: 8.h),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: Styles.s16_500,
                ),
                const LoginTextFiled(),
                AppButton(
                  buttonText: 'Login',
                  textStyle: Styles.s16_500.copyWith(
                    color: const Color(0xffffffff),
                  ),
                  onPressed: () {
                    if (cubit.loginKey.currentState!.validate()) {
                      cubit.postLogIn();
                    }
                  },
                ),
                SizedBox(height: 20.h),
                const LoginTextButtonSingup(),
                SizedBox(height: 40.h),
                Center(
                  child: SvgPicture.asset(
                    "assets/svg/Hungry_.svg",
                    height: 20.h,
                  ),
                ),
                const LogInCubit(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
