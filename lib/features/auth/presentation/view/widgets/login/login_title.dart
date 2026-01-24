import 'package:flutter/material.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/utils/styles.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome Back", style: Styles.s32_400),
        spaceH(8),
        Text(
          "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
          style: Styles.s16_500,
        ),
      ],
    );
  }
}
