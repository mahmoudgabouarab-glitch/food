import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Cheeseburger"),
          const Text("Wendy's Burger"),
          SizedBox(height: 9.h),
          Row(
            children: [
              Icon(Icons.star_rate_rounded, color: Colors.yellow[800]),
              const Text("4.6"),
            ],
          ),
        ],
      ),
    );
  }
}
