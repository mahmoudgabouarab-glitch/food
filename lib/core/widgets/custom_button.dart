import 'package:flutter/material.dart';
import 'package:food/core/utils/app_color.dart';

class Btn extends StatelessWidget {
  final void Function() ontap;

  final double radius;
  final String text;
  final double? minWidth;
  final Color? color;
  
  const Btn({
    super.key,
    required this.ontap,
    required this.radius,
    required this.text,
    this.minWidth,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: minWidth,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      onPressed: ontap,
      color: color ?? AppColor.btn,
      child: Center(child: Text(text)),
    );
  }
}
