import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/features/auth/presentation/view/login_view.dart';
import 'package:food/generated/locale_keys.g.dart';

class SignupTextBottonLogin extends StatelessWidget {
  const SignupTextBottonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        spaceH(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.have_account.tr(),
              style: Styles.s14_400.copyWith(color: const Color(0xffffffff)),
            ),
            TextButton(
              onPressed: () {
                context.pushReplacement(const LoginView());
              },
              child: Text(
                LocaleKeys.login.tr(),
                style: Styles.s12_500.copyWith(color: AppColor.textSecondary),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
