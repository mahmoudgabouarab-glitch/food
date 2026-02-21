import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/assets.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/utils/function.dart';
import 'package:food/features/settings/presentation/view/profile_view.dart';
import 'package:food/features/settings/presentation/view_model/profile/profile_cubit.dart';
import 'package:food/generated/locale_keys.g.dart';
import 'package:shimmer/shimmer.dart';

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
            title: isGuest ? _buildAppBarForGuest(context) : _buildAppBarBloc(),
          );
        },
      ),
    );
  }
}

Widget _buildImageGif() {
  return Image.asset(Assets.burgergif, fit: BoxFit.cover);
}

Widget _buildAppBarBloc() {
  return BlocBuilder<ProfileCubit, ProfileState>(
    builder: (context, state) {
      switch (state) {
        case ProfileInitial():
          break;
        case ProfileLoading():
          return _buildAppBarShimmer(context);
        case ProfileSuccess():
          return GestureDetector(
            onTap: () => context.push(
              BlocProvider.value(
                value: context.read<ProfileCubit>(),
                child: ProfileView(),
              ),
            ),
            child: _buildAppBarContent(
              context: context,
              title: "${LocaleKeys.hello.tr()} ${state.profilemodel.data.name}",
              childCircleAvatar: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: state.profilemodel.data.image,
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.person, size: 18),
                  width: 36.w,
                  height: 36.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        case ProfileFailure():
          return _buildAppBarContent(
            context: context,
            title: "",
            childCircleAvatar: ClipOval(
              child: const Icon(Icons.person, size: 18),
            ),
          );
      }
      return const SizedBox.shrink();
    },
  );
}

Widget _buildAppBarShimmer(BuildContext context) {
  return Container(
    width: double.infinity,
    height: kToolbarHeight,
    color: Theme.of(context).scaffoldBackgroundColor,
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Shimmer.fromColors(
      baseColor: Colors.grey.shade600,
      highlightColor: Colors.grey.shade500,
      child: Row(
        children: [
          Container(
            width: 80.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          const Spacer(),
          Container(
            width: 30.w,
            height: 30.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildAppBarContent({
  required BuildContext context,
  required String title,
  required Widget childCircleAvatar,
}) {
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
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontSize: 14.sp),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        CircleAvatar(
          backgroundColor: AppColor.textthirth,
          radius: 13.r,
          child: childCircleAvatar,
        ),
      ],
    ),
  );
}

Widget _buildAppBarForGuest(BuildContext context) {
  return _buildAppBarContent(
    context: context,
    title: LocaleKeys.waiting_for_you.tr(),
    childCircleAvatar: ClipOval(child: const Icon(Icons.person, size: 18)),
  );
}
