import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/features/home/data/model/products_model/products_model.dart';

class ProductDescription extends StatelessWidget {
  final ListOfProducts oneProduct;
  const ProductDescription({super.key, required this.oneProduct});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(oneProduct.name, maxLines: 1, overflow: TextOverflow.ellipsis),
          SizedBox(height: 4.h),
          Text(
            oneProduct.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 9.h),
          Row(
            children: [
              Icon(Icons.star_rate_rounded, color: Colors.yellow[800]),
              Text(oneProduct.rating),
              const Spacer(),
              Text(oneProduct.price),
            ],
          ),
        ],
      ),
    );
  }
}
