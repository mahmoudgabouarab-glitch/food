import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/features/settings/presentation/view/widgets/profile/open_profile_photo.dart';
import 'package:food/features/settings/presentation/view_model/profile/profile_cubit.dart';
import 'package:shimmer/shimmer.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return SizedBox(
          height: 140.h,
          width: 140.w,
          child: _buildAvatar(state, context),
        );
      },
    );
  }

  Widget _buildAvatar(ProfileState state, BuildContext context) {
    if (state is ProfileSuccess) {
      return GestureDetector(
        onTap: () {
          context.push(OpenProfilePhoto(url: state.profilemodel.data.image));
        },
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: state.profilemodel.data.image,
            errorWidget: (context, url, error) =>
                const Icon(Icons.person, size: 80),
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade700,
                    highlightColor: Colors.grey.shade600,
                    child: Container(
                      height: 140.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
