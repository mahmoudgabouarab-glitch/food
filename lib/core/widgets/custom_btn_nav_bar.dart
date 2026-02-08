import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/generated/locale_keys.g.dart';

class CustomBtnNavBar extends StatelessWidget {
  final Widget? child;
  final String? text;
  final void Function()? ontap;
  final String title;
  final double? horizontal;
  const CustomBtnNavBar({
    super.key,
    this.text,
    required this.ontap,
    required this.title,
    this.child,
    this.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 26.w,
        vertical: 28.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.total.tr()),
              Text(title, style: Styles.s16_600),
            ],
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            onPressed: ontap,
            color: AppColor.btn,
            child:
                child ??
                Text(
                  text ?? "",
                  style: Styles.s16_500.copyWith(color: Colors.white),
                ),
          ),
        ],
      ),
    );
  }
}
