import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/features/details/presentation/view/details_view.dart';
import 'package:food/features/home/presentation/view/widgets/product_description.dart';
import 'package:food/features/home/presentation/view/widgets/product_item_stack.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15.h,
          crossAxisSpacing: 10.w,
          childAspectRatio: .95.h,
        ),
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => context.push(const DetailsView()),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h),
                  const ProductItemStack(),
                  const ProductDescription(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
