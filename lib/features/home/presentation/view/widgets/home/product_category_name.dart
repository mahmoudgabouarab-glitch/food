import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/features/home/presentation/view_model/category_cubit/category_cubit.dart';

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
        return SliverToBoxAdapter(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: state is CategorySuccess
                  ? List.generate(state.categoryModel.data.length, (index) {
                      final cubit = state.categoryModel.data[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 14.w),
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
                    })
                  : [],
            ),
          ),
        );
      },
    );
  }
}
