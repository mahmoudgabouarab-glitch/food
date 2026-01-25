import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/features/auth/presentation/view_model/profile/profile_cubit.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      expandedHeight: 180.h,
      pinned: true,
      floating: false,
      snap: false,
      automaticallyImplyLeading: false,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          return FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            centerTitle: false,
            titlePadding: EdgeInsets.zero,
            background:
                constraints.biggest.height >
                    MediaQuery.of(context).padding.top + kToolbarHeight
                ? _buildImageGif()
                : null,
            title: _buildAppBarContent(),
          );
        },
      ),
    );
  }

  Widget _buildImageGif() {
    return Image.asset("assets/image/burger.gif", fit: BoxFit.cover);
  }

  Widget _buildAppBarContent() {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: kToolbarHeight,
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  state is ProfileSuccess
                      ? "Hello ${state.profilemodel.data.name}"
                      : "Hello .......",
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontSize: 14.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 18.r,
                child: state is ProfileSuccess
                    ? ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: state.profilemodel.data.image,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.person, size: 18),
                          width: 36.w,
                          height: 36.h,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Center(
                        child: CupertinoActivityIndicator(
                          color: AppColor.btn,
                          radius: 6.r,
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
