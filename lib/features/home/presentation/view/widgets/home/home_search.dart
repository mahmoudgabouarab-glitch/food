import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/core/widgets/custom_text_filed.dart';
import 'package:food/features/home/presentation/view_model/search_cubit/search_products_cubit.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductsCubit, SearchProductsState>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
              bottom: 20.h,
              top: 5.h,
            ),
            child: _buildField(
              label: "Search",
              onchange: (value) => context
                  .read<SearchProductsCubit>()
                  .searchProducts(query: value.toLowerCase()),
              prefixIcon: const Icon(
                Icons.search,
                color: AppColor.textSecondary,
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _buildField({
  required String label,
  Function(String)? onchange,
  Widget? prefixIcon,
}) {
  return CustomTextFormFiled(
    prefixIcon: prefixIcon,
    onchange: onchange,
    textstyle: const TextStyle(color: Colors.white),
    fillcolor: AppColor.surface,
    labelText: label,
    labelStyle: Styles.s14_700.copyWith(color: AppColor.primary),
  );
}
