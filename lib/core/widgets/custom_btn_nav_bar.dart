import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/styles.dart';

class CustomBtnNavBar extends StatelessWidget {
  final Widget? child;
  final String? text;
  final void Function()? ontap;
  final String title;
  const CustomBtnNavBar({
    super.key,
    this.text,
    required this.ontap,
    required this.title,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 28.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Total"),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
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
