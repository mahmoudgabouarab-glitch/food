import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/core/widgets/app_text_button.dart';
import 'package:food/features/auth/presentation/view_model/signup/signup_cubit.dart';

class SignupActions extends StatelessWidget {
  const SignupActions({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return AppButton(
      buttonText: 'Sign Up',
      textStyle: Styles.s16_500.copyWith(color:AppColor.textPrimary),

      onPressed: () {
        if (cubit.signupKey.currentState!.validate()) {
          cubit.postSignup();
        }
      },
    );
  }
}
