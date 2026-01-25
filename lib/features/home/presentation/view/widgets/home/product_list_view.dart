import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/features/home/presentation/view/details_view.dart';
import 'package:food/features/home/presentation/view/widgets/home/product_description.dart';
import 'package:food/features/home/presentation/view/widgets/home/product_item_stack.dart';
import 'package:food/features/home/presentation/view_model/products_cubit/products_cubit.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is ProductsSuccess) {
          return SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15.h,
                crossAxisSpacing: 10.w,
                childAspectRatio: .8.h,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final product = state.productsModel.data[index];
                return InkWell(
                  onTap: () => context.push(const DetailsView()),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 5.h),
                        ProductItemStack(oneProduct: product),
                        ProductDescription(oneProduct: product),
                      ],
                    ),
                  ),
                );
              }, childCount: state.productsModel.data.length),
            ),
          );
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
