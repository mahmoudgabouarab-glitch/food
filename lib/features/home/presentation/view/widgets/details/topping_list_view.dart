import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/widgets/custom_loading.dart';
import 'package:food/features/home/presentation/view_model/details_cubit/detsils_cubit/details_cubit.dart';
import 'package:food/features/home/presentation/view_model/details_cubit/detsils_cubit/details_state.dart';

class ToppingListView extends StatelessWidget {
  const ToppingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state.isLoading == true) {
          return const CustomLoading();
        }
        if (state.toppingsModel == null) {
          return const SizedBox.shrink();
        }
        return _toppingList(state, context);
      },
    );
  }
}

Widget _toppingList(DetailsState state, BuildContext context) {
  final toppings = state.toppingsModel!.data;

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(toppings.length, (index) {
        final topping = toppings[index];
        final isSelected = state.selectedtoppings.contains(index);

        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: () {
              context.read<DetailsCubit>().selectTopping(index);
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              height: 115.h,
              width: 120.w,
              decoration: BoxDecoration(
                gradient: isSelected
                    ? const LinearGradient(
                        colors: AppColor.linearCATE2,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    : const LinearGradient(
                        colors: AppColor.linearCATE,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                children: [
                  CachedNetworkImage(imageUrl: topping.image, height: 55.h),
                  const Spacer(),
                  Text(topping.name),
                ],
              ),
            ),
          ),
        );
      }),
    ),
  );
}
