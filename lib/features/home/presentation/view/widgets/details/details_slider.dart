import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/features/home/data/model/products_model/products_model.dart';

class DetailsSlider extends StatefulWidget {
  final ListOfProducts products;
  const DetailsSlider({super.key, required this.products});

  @override
  State<DetailsSlider> createState() => _DetailsSliderState();
}

class _DetailsSliderState extends State<DetailsSlider> {
  double slider = .5;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CachedNetworkImage(imageUrl: widget.products.image, height: 140.h),
        spaceW(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${widget.products.name}\n\n',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primary,
                      ),
                    ),
                    TextSpan(
                      text: widget.products.description,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              spaceH(20),
              Slider(
                activeColor: AppColor.primary,
                inactiveColor: AppColor.textSecondary,
                thumbColor: AppColor.primary,
                divisions: 5,
                padding: EdgeInsets.zero,
                value: slider,
                onChanged: (val) {
                  setState(() {
                    slider = val;
                  });
                },
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(Icons.ac_unit_rounded, color: Colors.blue[300]),
                  const Spacer(),
                  Icon(
                    Icons.local_fire_department_outlined,
                    color: Colors.red[800],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
