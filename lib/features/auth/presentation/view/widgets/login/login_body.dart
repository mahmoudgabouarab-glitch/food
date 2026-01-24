import 'package:flutter/material.dart';
import 'package:food/features/auth/presentation/view/widgets/login/login_actions.dart';
import 'package:food/features/auth/presentation/view/widgets/login/login_cubit.dart';
import 'package:food/features/auth/presentation/view/widgets/login/login_title.dart';
import 'package:food/features/auth/presentation/view/widgets/login/login_text_button_signup.dart';
import 'package:food/features/auth/presentation/view/widgets/login/login_text_filed.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginTitle(),
                const LoginTextFiled(),
                const LoginActions(),
                const LoginTextButtonSingup(),
                const LogInCubit(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
