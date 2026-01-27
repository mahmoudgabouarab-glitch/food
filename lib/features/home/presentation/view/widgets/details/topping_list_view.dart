import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/widgets/custom_loading.dart';
import 'package:food/features/home/presentation/view_model/details_cubit/toppings_cubit/toppings_cubit.dart';

class ToppingListView extends StatelessWidget {
  const ToppingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToppingsCubit, ToppingsState>(
      builder: (context, state) {
        switch (state) {
          case ToppingsInitial():
            break;
          case ToppingsLoading():
            return const CustomLoading();
          case ToppingsSuccess():
            return _toppingList(state, context);
          case ToppingsFailure():
            break;
        }
        return const SizedBox.shrink();
      },
    );
  }
}

Widget _toppingList(ToppingsSuccess state, BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(state.toppingsModel.data.length, (index) {
        final cubit = state.toppingsModel.data[index];
        final isSelected = state.selectedIndexes.contains(index);
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: () {
              context.read<ToppingsCubit>().selectToppings(index);
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              height: 115.h,
              width: 120.w,
              decoration: BoxDecoration(
                gradient: isSelected
                    ? const LinearGradient(
                        colors: AppColor.linearCATE2,
                        begin: AlignmentGeometry.topCenter,
                        end: AlignmentGeometry.bottomCenter,
                      )
                    : const LinearGradient(
                        colors: AppColor.linearCATE,
                        begin: AlignmentGeometry.topCenter,
                        end: AlignmentGeometry.bottomCenter,
                      ),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                children: [
                  CachedNetworkImage(imageUrl: cubit.image, height: 55.h),
                  const Spacer(),
                  Text(cubit.name),
                ],
              ),
            ),
          ),
        );
      }),
    ),
  );
}
