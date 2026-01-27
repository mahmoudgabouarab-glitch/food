import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/widgets/custom_loading.dart';
import 'package:food/features/home/presentation/view_model/details_cubit/detsils_cubit/details_cubit.dart';
import 'package:food/features/home/presentation/view_model/details_cubit/detsils_cubit/details_state.dart';

class SideOptionsListView extends StatelessWidget {
  const SideOptionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const CustomLoading();
        }
        if (state.sideOptionsModel == null) {
          return const SizedBox.shrink();
        }
        return _sideOptionsList(state, context);
      },
    );
  }
}

Widget _sideOptionsList(DetailsState state, BuildContext context) {
  final sideOptions = state.sideOptionsModel!.data;

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(sideOptions.length, (index) {
        final option = sideOptions[index];
        final isSelected = state.selectedsideOptions.contains(index);

        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: () {
              context.read<DetailsCubit>().selectSideOption(index);
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
                  CachedNetworkImage(imageUrl: option.image, height: 55.h),
                  const Spacer(),
                  Text(option.name),
                ],
              ),
            ),
          ),
        );
      }),
    ),
  );
}
