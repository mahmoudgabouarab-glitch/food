import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/features/home/presentation/view_model/details_cubit/details_cubit.dart';

class ToppingListView extends StatelessWidget {
  const ToppingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.toppings!= null) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(state.toppings!.data.length, (index) {
                final cubit = state.toppings!.data[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 115.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: AppColor.linearCATE,
                        begin: AlignmentGeometry.topCenter,
                        end: AlignmentGeometry.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.r),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: cubit.image,
                            height: 55.h,
                          ),
                        ),
                        const Spacer(),
                        Text(cubit.name),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}