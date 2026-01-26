import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/widgets/custom_text_filed.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 20.h),
        child: CustomTextFormFiled(
          hint: "Search",
          prefixIcon: Icon(Icons.search, color: Colors.black),
        ),
      ),
    );
  }
}
