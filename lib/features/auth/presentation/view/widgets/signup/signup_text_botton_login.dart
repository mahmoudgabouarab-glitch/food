import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/features/auth/presentation/view/login_view.dart';

class SignupTextBottonLogin extends StatelessWidget {
  const SignupTextBottonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account?",
              style: Styles.s14_400.copyWith(color: const Color(0xffffffff)),
            ),
            TextButton(
              onPressed: () {
                context.pushReplacement(const LoginView());
              },
              child: Text(
                "LogIn",
                style: Styles.s12_500.copyWith(color: AppColor.textSecondary),
              ),
            ),
          ],
        ),
        SizedBox(height: 40.h),
        Center(child: SvgPicture.asset("assets/svg/Hungry_.svg", height: 20.h)),
      ],
    );
  }
}
