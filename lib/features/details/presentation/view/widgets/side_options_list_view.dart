import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';

class SideOptionsListView extends StatelessWidget {
  const SideOptionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(10, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              padding: const EdgeInsets.all(5),
              height: 115.h,
              width: 120.w,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: AppColor.linearCATE,
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.r),
                    ),
                    child: Image.asset("assets/image/test3.png", width: 60.w),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Text("tomato"),
                      const Spacer(),
                      CircleAvatar(
                        maxRadius: 11.r,
                        backgroundColor: AppColor.primary,
                        child: Center(child: Icon(Icons.add, size: 20.sp)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
