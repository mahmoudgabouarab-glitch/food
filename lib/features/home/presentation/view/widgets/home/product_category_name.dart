import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/features/home/presentation/view_model/category_cubit/category_cubit.dart';
import 'package:shimmer/shimmer.dart';

class ProductCategoryName extends StatefulWidget {
  const ProductCategoryName({super.key});

  @override
  State<ProductCategoryName> createState() => _ProductCategoryNameState();
}

class _ProductCategoryNameState extends State<ProductCategoryName> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        switch (state) {
          case CategoryInitial():
            break;
          case CategoryLoading():
            return _buildShimmerCategore();
          case CategorySuccess():
            return SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(state.categoryModel.data.length, (
                    index,
                  ) {
                    final cubit = state.categoryModel.data[index];
                    return Padding(
                      padding: currentIndex == 0
                          ? EdgeInsets.only(left: 12.w)
                          : EdgeInsets.only(right: 12.w),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        onPressed: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        color: currentIndex == index
                            ? AppColor.btn
                            : AppColor.background,
                        child: Text(
                          cubit.name,
                          style: Styles.s16_500.copyWith(
                            color: currentIndex == index
                                ? Colors.white
                                : AppColor.textthirth,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            );
          case CategoryFailure():
            return SliverToBoxAdapter(child: Center(child: Text(state.err)));
        }
        return const SizedBox.shrink();
      },
    );
  }
}

Widget _buildShimmerCategore() {
  return SliverToBoxAdapter(
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          4,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade600,
              highlightColor: Colors.grey.shade500,
              child: Container(
                width: 90.w,
                height: 35.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
