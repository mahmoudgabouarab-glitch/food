import 'package:flutter/material.dart';
import 'package:food/features/home/presentation/view/widgets/home/home_app_bar.dart';
import 'package:food/features/home/presentation/view/widgets/home/home_search.dart';
import 'package:food/features/home/presentation/view/widgets/home/product_category_name.dart';
import 'package:food/features/home/presentation/view/widgets/home/product_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          HomeAppBar(),
          HomeSearch(),
          ProductCategoryName(),
          ProductListView(),
        ],
      ),
    );
  }
}
