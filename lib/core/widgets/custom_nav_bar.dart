import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';

class CustomBtnNavigation extends StatelessWidget {
  const CustomBtnNavigation({
    super.key,
    required this.currentIndex,
    required this.icon,
    required this.index,
  });

  final int currentIndex;
  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 2.h,
          width: 49.w,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? AppColor.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 14),
        Icon(
          icon,
          color: currentIndex == index
              ? AppColor.primary
              : AppColor.textSecondary,
        ),
      ],
    );
  }
}
