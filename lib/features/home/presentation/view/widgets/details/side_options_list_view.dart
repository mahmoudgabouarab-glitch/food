import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/widgets/custom_loading.dart';
import 'package:food/features/home/presentation/view_model/details_cubit/side_options_cubit/side_options_cubit.dart';

class SideOptionsListView extends StatelessWidget {
  const SideOptionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SideOptionsCubit, SideOptionsState>(
      builder: (context, state) {
        switch (state) {
          case SideOptionsInitial():
            break;
          case SideOptionsLoading():
            return const CustomLoading();
          case SideOptionsSuccess():
            return _sideOptionsList(state);
          case SideOptionsFailure():
            break;
        }
        return const SizedBox.shrink();
      },
    );
  }
}

Widget _sideOptionsList(SideOptionsSuccess state) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(state.sideOptionsModel.data.length, (index) {
        final cubit = state.sideOptionsModel.data[index];
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: InkWell(
            onTap: () {},
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
