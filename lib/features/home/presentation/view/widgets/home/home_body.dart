import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/widgets/custom_text_filed.dart';
import 'package:food/features/home/presentation/view/widgets/home/home_app_bar.dart';
import 'package:food/features/home/presentation/view/widgets/home/product_category_name.dart';
import 'package:food/features/home/presentation/view/widgets/home/product_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const HomeAppBar(),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(
              child: const CustomTextFormFiled(
                hint: "Search",
                prefixIcon: Icon(Icons.search, color: Colors.black),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            const ProductCategoryName(),
            const ProductListView(),
          ],
        ),
      ),
    );
  }
}
