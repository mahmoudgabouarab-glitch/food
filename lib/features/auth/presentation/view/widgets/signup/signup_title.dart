import 'package:flutter/material.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/utils/styles.dart';

class SignupTitle extends StatelessWidget {
  const SignupTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Create Account', style: Styles.s32_400),
        spaceH(8),
        Text(
          'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
          style: Styles.s16_500,
        ),
        spaceH(20),
      ],
    );
  }
}
