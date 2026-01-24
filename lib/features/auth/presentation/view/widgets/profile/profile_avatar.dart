import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/features/auth/presentation/view_model/profile/profile_cubit.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    final picker = ImagePicker();

    return GestureDetector(
      onTap: () async {
        final image = await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          cubit.pickImage(image);
        }
      },
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return SizedBox(
            height: 140.h,
            width: 140.w,
            child: _buildAvatar(state, cubit),
          );
        },
      ),
    );
  }

  Widget _buildAvatar(ProfileState state, ProfileCubit cubit) {
    if (cubit.selectedImage != null) {
      return ClipOval(
        child: Image.file(File(cubit.selectedImage!.path), fit: BoxFit.cover),
      );
    }
    if (state is ProfileSuccess && state.profilemodel.data.image.isNotEmpty) {
      return ClipOval(
        child: CachedNetworkImage(
          imageUrl: state.profilemodel.data.image,
          errorWidget: (context, url, error) => const Icon(Icons.person),
          fit: BoxFit.cover,
        ),
      );
    }
   
    return const Icon(Icons.person, size: 60);
  }
}
