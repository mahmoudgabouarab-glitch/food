import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/features/auth/presentation/view_model/profile/profile_cubit.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return SliverPadding(
          padding: EdgeInsetsGeometry.only(top: 20.h),
          sliver: SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            pinned: true,
            automaticallyImplyLeading: false,
            toolbarHeight: 70.h,
            title: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/svg/Hungry_.svg", height: 23),
                    SizedBox(height: 8.h),
                    Text(
                      state is ProfileSuccess
                          ? "Hello ${state.profilemodel.data.name}"
                          : "Hello .......",
                    ),
                  ],
                ),
                const Spacer(),
                CircleAvatar(
                  backgroundColor: AppColor.textSecondary,
                  radius: 23,
                  child: state is ProfileSuccess
                      ? ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: state.profilemodel.data.image,
                            width: 80,
                            height: 80,
                          ),

                          //   Image.network(
                          //     state.profilemodel.data.image,
                          //     width: 80,
                          //     height: 80,
                          //     fit: BoxFit.cover,
                          //   ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
