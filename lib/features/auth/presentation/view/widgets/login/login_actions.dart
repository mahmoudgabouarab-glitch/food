import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/core/widgets/app_text_button.dart';
import 'package:food/features/auth/presentation/view_model/login/login_cubit.dart';

class LoginActions extends StatelessWidget {
  const LoginActions({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return AppButton(
      buttonText: 'Login',
      textStyle: Styles.s16_500.copyWith(color: const Color(0xffffffff)),
      onPressed: () async {
        if (cubit.loginKey.currentState!.validate()) {
          await cubit.postLogIn();
        }
      },
    );
  }
}
