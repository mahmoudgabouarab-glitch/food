import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/features/home/data/model/products_model/products_model.dart';
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
        switch (state) {
          case ProductsInitial():
            break;
          case ProductsLoading():
            return const _LoadingSliver();
          case ProductsSuccess():
            return _ProductsGrid(products: state.productsModel.data);
          case ProductsFailure():
            break;
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}

class _LoadingSliver extends StatelessWidget {
  const _LoadingSliver();

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(child: CupertinoActivityIndicator(color: AppColor.btn)),
    );
  }
}

class _ProductsGrid extends StatelessWidget {
  final List<ListOfProducts> products;

  const _ProductsGrid({required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15.h,
          crossAxisSpacing: 10.w,
          childAspectRatio: 1.w / 1.2.h,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => _ProductItem(product: products[index]),
          childCount: products.length,
        ),
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  final dynamic product;

  const _ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(DetailsView(products: product)),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceH(5),
            ProductItemStack(oneProduct: product),
            ProductDescription(oneProduct: product),
          ],
        ),
      ),
    );
  }
}
