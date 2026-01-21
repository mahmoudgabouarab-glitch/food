import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItemStack extends StatelessWidget {
  final double? width;
  const ProductItemStack({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 121.h,
      width: width,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Image.asset("assets/image/elevation.png", height: 40.h),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 9.h,
            child: Image.asset("assets/image/test.png", height: 110.h),
          ),
        ],
      ),
    );
  }
}
