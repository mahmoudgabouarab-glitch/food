import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/widgets/custom_text_filed.dart';
import 'package:food/features/home/presentation/view/widgets/home_app_bar.dart';
import 'package:food/features/home/presentation/view/widgets/product_category_name.dart';
import 'package:food/features/home/presentation/view/widgets/product_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const HomeAppBar(),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                const CustomTextFormFiled(
                  hint: "Search",
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                ),
                SizedBox(height: 20.h),
                const ProductCategoryName(),
              ],
            ),
          ),
        ),
        const ProductListView(),
      ],
    );
  }
}
