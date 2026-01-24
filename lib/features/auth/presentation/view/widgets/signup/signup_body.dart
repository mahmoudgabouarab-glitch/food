import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/features/auth/presentation/view/widgets/signup/signup_actions.dart';
import 'package:food/features/auth/presentation/view/widgets/signup/signup_bloc.dart';
import 'package:food/features/auth/presentation/view/widgets/signup/signup_text_botton_login.dart';
import 'package:food/features/auth/presentation/view/widgets/signup/signup_text_filed.dart';
import 'package:food/features/auth/presentation/view/widgets/signup/signup_title.dart';
import 'package:food/features/auth/presentation/view/widgets/signup/upload_pic_profile.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
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
    );
  }
}
