import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';

class CustomListTitleSittings extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget? leading;
  final void Function()? onTap;
  final Color? color;
  final Widget? trailing;
  const CustomListTitleSittings({
    super.key,
    required this.title,
    this.icon,
    this.leading,
    this.onTap,
    this.color,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: Card(
          margin: EdgeInsets.zero,
          child: ListTile(
            leading: leading ?? Icon(icon, color: color ?? AppColor.primary),
            title: Text(title),
            trailing: trailing,
          ),
        ),
      ),
    );
  }
}
