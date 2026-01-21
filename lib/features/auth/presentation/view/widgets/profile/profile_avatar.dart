import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return CircleAvatar(
            radius: 80,
            backgroundImage: cubit.selectedImage != null
                ? FileImage(File(cubit.selectedImage!.path))
                : state is ProfileSuccess
                    ? NetworkImage(state.profilemodel.data.image)
                        as ImageProvider
                    : null,
          );
        },
      ),
    );
  }
}
