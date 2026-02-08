import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/features/profile/presentation/view/profile_view.dart';
import 'package:food/features/profile/presentation/view_model/profile/profile_cubit.dart';
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
