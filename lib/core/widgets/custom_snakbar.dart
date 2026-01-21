import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';

class CustomSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color backgroundColor;
    Icon icon;

    switch (type) {
      case SnackBarType.success:
        backgroundColor = Colors.green.shade600;
        icon = const Icon(Icons.check_circle, color: Colors.white);
        break;
      case SnackBarType.error:
        backgroundColor = Colors.red.shade600;
        icon = const Icon(Icons.error, color: Colors.white);
        break;
      case SnackBarType.warning:
        backgroundColor = Colors.orange.shade700;
        icon = const Icon(Icons.warning, color: Colors.white);
        break;
      default:
        backgroundColor = AppColor.textthirth;
        icon = const Icon(Icons.info, color: Colors.white);
    }

    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      duration: duration,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      content: Row(
        children: [
          icon,
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

enum SnackBarType { success, error, warning, info }
