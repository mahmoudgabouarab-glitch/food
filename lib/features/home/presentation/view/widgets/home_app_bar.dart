import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_color.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.only(top: 20.h),
      sliver: SliverAppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        pinned: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 70.h,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/svg/Hungry_.svg", height: 23),
                SizedBox(height: 8.h),
                const Text("Hello, Rich Sonic"),
              ],
            ),
            const Spacer(),
            const CircleAvatar(
              backgroundColor: AppColor.textSecondary,
              radius: 23,
            ),
          ],
        ),
      ),
    );
  }
}
