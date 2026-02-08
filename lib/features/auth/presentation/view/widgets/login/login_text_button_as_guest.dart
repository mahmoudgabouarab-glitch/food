import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food/core/network/cache_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/network/cache_keys.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/features/main_layout.dart';
import 'package:food/generated/locale_keys.g.dart';

class LoginTextButtonAsGuest extends StatelessWidget {
  const LoginTextButtonAsGuest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () async {
            await CacheHelper.saveData(key: CacheKeys.isGuest, value: true);
            context.pushReplacement(const MainLayout());
          },
          child: Text(
            LocaleKeys.guest_login.tr(),
            style: Styles.s14_700.copyWith(color: AppColor.textSecondary),
          ),
        ),
        Divider(color: AppColor.textSecondary, thickness: 0, height: 0.h),
      ],
    );
  }
}
