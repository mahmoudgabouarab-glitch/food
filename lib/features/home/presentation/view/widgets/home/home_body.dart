import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/features/home/presentation/view/widgets/home/home_app_bar.dart';
import 'package:food/features/home/presentation/view/widgets/home/home_search.dart';
import 'package:food/features/home/presentation/view/widgets/home/product_category_name.dart';
import 'package:food/features/home/presentation/view/widgets/home/product_list_view.dart';
import 'package:food/features/home/presentation/view_model/category_cubit/category_cubit.dart';
import 'package:food/features/home/presentation/view_model/products_cubit/products_cubit.dart';
import 'package:food/features/profile/presentation/view_model/profile/profile_cubit.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        displacement: 100.h,
        color: AppColor.primary,
        onRefresh: () {
          context.read<CategoryCubit>().getCategory();
          context.read<ProductsCubit>().getProducts();
          context.read<ProfileCubit>().getProfile();
          return Future.value();
        },
        child: const CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            HomeAppBar(),
            HomeSearch(),
            ProductCategoryName(),
            ProductListView(),
          ],
        ),
      ),
    );
  }
}
