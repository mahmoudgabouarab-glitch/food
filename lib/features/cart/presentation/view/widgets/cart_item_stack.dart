import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemStack extends StatelessWidget {
  final String imageUrl;
  const CartItemStack({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      width: 160.w,
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
            bottom: 0,
            child: CachedNetworkImage(imageUrl: imageUrl, height: 140.h),
          ),
        ],
      ),
    );
  }
}
