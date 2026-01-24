import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/styles.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome Back", style: Styles.s32_400),
        SizedBox(height: 8.h),
        Text(
          "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
          style: Styles.s16_500,
        ),
      ],
    );
  }
}
