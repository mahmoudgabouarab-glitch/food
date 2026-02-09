import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/features/settings/presentation/view/profile_view.dart';
import 'package:food/features/settings/presentation/view_model/profile/profile_cubit.dart';
import 'package:shimmer/shimmer.dart';

class ListTitleProfileAvatar extends StatelessWidget {
  const ListTitleProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          return GestureDetector(
            onTap: () {
              context.push(
                BlocProvider.value(
                  value: context.read<ProfileCubit>(),
                  child: const ProfileView(),
                ),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 70.h, width: 70.w, child: _buildAvatar(state)),
                spaceW(12),
                SizedBox(
                  width: 200.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.profilemodel.data.name,
                        style: Styles.s16_600,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      spaceH(6),
                      Text(
                        state.profilemodel.data.email,
                        style: Styles.s14_400,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                SizedBox(height: 45.h, width: 45.w, child: Icon(Icons.edit)),
              ],
            ),
          );
        }
        if (state is ProfileLoading) {
          return _buildSimmerListTitleProfileAvatar();
        }
        return const SizedBox.shrink();
      },
    );
  }
}

Widget _buildAvatar(ProfileState state) {
  if (state is ProfileSuccess) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: state.profilemodel.data.image,
        errorWidget: (context, url, error) =>
            const Icon(Icons.person, size: 40),
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade700,
            highlightColor: Colors.grey.shade600,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
  return const SizedBox.shrink();
}

Widget _buildSimmerListTitleProfileAvatar() {
  return Container(
    height: 70.h,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.grey.shade800,
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Shimmer.fromColors(
      baseColor: Colors.grey.shade700,
      highlightColor: Colors.grey.shade600,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70.h,
              width: 70.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            spaceW(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 14.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                spaceH(6),
                Container(
                  height: 14.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ],
            ),
            Spacer(),
            Center(
              child: Container(
                height: 45.h,
                width: 45.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
