import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/core/widgets/custom_button.dart';
import 'package:food/features/auth/presentation/view/login_view.dart';

class CustomWidgetErr extends StatelessWidget {
  final String text;
  const CustomWidgetErr({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.follow_the_signs_sharp, size: 150.sp),
          spaceH(20),
          Text(text, style: Styles.s16_500),
          spaceH(20),
          Btn(
            ontap: () {
              context.pushReplacement(const LoginView());
            },
            radius: 20,
            child: Text("Login", style: Styles.s18_600),
          ),
        ],
      ),
    );
  }
}
