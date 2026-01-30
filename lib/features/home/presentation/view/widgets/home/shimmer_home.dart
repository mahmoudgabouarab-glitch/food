import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHome extends StatelessWidget {
  const ShimmerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15.h,
          crossAxisSpacing: 10.w,
          childAspectRatio: 1.w / 1.25.h,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade600,
              highlightColor: Colors.grey.shade500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spaceH(5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Container(
                      height: 120.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                  ),
                  spaceH(10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 16.h,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                        spaceH(8),
                        Container(
                          height: 14.h,
                          width: 120.w,
                          color: Colors.white,
                        ),
                        spaceH(25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 15.h,
                              width: 70.w,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 30.sp,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  spaceH(5),
                ],
              ),
            ),
          ),
          childCount: 10,
        ),
      ),
    );
  }
}
