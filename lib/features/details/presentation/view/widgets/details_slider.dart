import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';

class DetailsSlider extends StatefulWidget {
  const DetailsSlider({super.key});

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
        Image.asset("assets/image/test2.png", height: 210.h),
        SizedBox(width: 30.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Customize Your Burger to Your Tastes. Ultimate Experience",
                maxLines: 3,
                overflow: TextOverflow.clip,
              ),
              SizedBox(height: 40.h),
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
                  print(val);
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
