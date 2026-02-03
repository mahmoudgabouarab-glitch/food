import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/features/auth/presentation/view/signup_view.dart';
import 'package:food/features/main_layout.dart';

class LoginTextButtonSingup extends StatelessWidget {
  const LoginTextButtonSingup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        spaceH(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: Styles.s14_400.copyWith(color: const Color(0xffffffff)),
            ),
            TextButton(
              onPressed: () {
                context.pushReplacement(const SignupView());
              },
              child: Text(
                "Sign Up",
                style: Styles.s12_500.copyWith(color: AppColor.textSecondary),
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            context.pushReplacement(const MainLayout());
          },
          child: Text(
            "LogIn as Guest",
            style: Styles.s12_500.copyWith(color: AppColor.textSecondary),
          ),
        ),
        Divider(color: AppColor.textSecondary, thickness: 0, height: 0.h),
      ],
    );
  }
}
