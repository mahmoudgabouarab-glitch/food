import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/features/home/data/model/products_model/products_model.dart';
import 'package:food/features/home/presentation/view_model/details_cubit/slider_cubit.dart';

class DetailsSlider extends StatelessWidget {
  final ListOfProducts products;

  const DetailsSlider({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CachedNetworkImage(imageUrl: products.image, height: 140.h),
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
                      text: '${products.name}\n\n',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primary,
                      ),
                    ),
                    TextSpan(
                      text: products.description,
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
              _slider(),
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

Widget _slider() {
  return BlocBuilder<SpicyCubit, double>(
    buildWhen: (p, c) => p != c,
    builder: (context, state) {
      return Slider(
        activeColor: AppColor.primary,
        inactiveColor: AppColor.textSecondary,
        thumbColor: AppColor.primary,
        min: 0.1,
        max: 1.0,
        divisions: 9,
        padding: EdgeInsets.zero,
        value: state,
        onChanged: (val) {
          context.read<SpicyCubit>().changeSpicy(val);
        },
      );
    },
  );
}
