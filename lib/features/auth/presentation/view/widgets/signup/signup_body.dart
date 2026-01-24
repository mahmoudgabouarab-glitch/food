import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/features/auth/presentation/view/widgets/signup/signup_actions.dart';
import 'package:food/features/auth/presentation/view/widgets/signup/signup_bloc.dart';
import 'package:food/features/auth/presentation/view/widgets/signup/signup_text_botton_login.dart';
import 'package:food/features/auth/presentation/view/widgets/signup/signup_text_filed.dart';
import 'package:food/features/auth/presentation/view/widgets/signup/signup_title.dart';
import 'package:food/features/auth/presentation/view/widgets/signup/upload_pic_profile.dart';
import 'package:food/features/auth/presentation/view_model/signup/signup_cubit.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
            child: Form(
              key: cubit.signupKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SignupTitle(),
                  const UploadPicProfile(),
                  const SignupTextFiled(),
                  const SignupActions(),
                  const SignupTextBottonLogin(),
                  const SignupBloc(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
