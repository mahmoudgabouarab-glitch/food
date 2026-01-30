import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/assets.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/utils/styles.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            Assets.logo,
            height: 130.h,
            opacity: const AlwaysStoppedAnimation(.7),
          ),
        ),
        spaceH(30),
        Text(
          "Welcome Back",
          style: Styles.s32_400.copyWith(color: AppColor.textPrimary),
        ),
        spaceH(8),
        Text(
          "Your favorite burgers are waiting for you",
          style: Styles.s16_500.copyWith(color: AppColor.textSecondary),
        ),
      ],
    );
  }
}
