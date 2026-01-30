import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/features/home/data/model/products_model/products_model.dart';

class ProductDescription extends StatefulWidget {
  final int index;
  final ListOfProducts oneProduct;
  const ProductDescription({
    super.key,
    required this.oneProduct,
    required this.index,
  });

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  int? counter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.oneProduct.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          spaceH(4),
          Text(
            widget.oneProduct.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey[200]),
          ),
          SizedBox(height: 9.h),
          Row(
            children: [
              Icon(Icons.star_rate_rounded, color: Colors.yellow[800]),
              Text(widget.oneProduct.rating),
              const Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    if (counter == widget.index) {
                      counter = null;
                      print("not vaf");
                    } else {
                      counter = widget.index;

                      print(' vaf');
                    }
                  });
                },
                child: counter == widget.index
                    ? Icon(Icons.favorite, color: Colors.red, size: 30.sp)
                    : Icon(
                        Icons.favorite_border,
                        color: Colors.black.withOpacity(0.7),
                        size: 30.sp,
                      ),
              ),
              // Text(
              //   "\$${oneProduct.price}",
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 12.sp,
              //     color: Colors.black,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
