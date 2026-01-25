import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/features/home/data/model/products_model/products_model.dart';

class ProductItemStack extends StatelessWidget {
  final ListOfProducts oneProduct;
  final double? width;
  const ProductItemStack({super.key, this.width, required this.oneProduct});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
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
            bottom: 8.h,
            child: CachedNetworkImage(
              imageUrl: oneProduct.image,
              height: 100.h,
            ),
          ),
        ],
      ),
    );
  }
}
