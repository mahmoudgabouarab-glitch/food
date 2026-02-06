import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/features/auth/presentation/view/widgets/signup/list_title_upload_pic_profile.dart';
import 'package:food/features/auth/presentation/view_model/signup/signup_cubit.dart';
import 'package:image_picker/image_picker.dart';

class UploadPicProfile extends StatelessWidget {
  const UploadPicProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final uploadimage = context.read<SignupCubit>();
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => SizedBox(
                    height: 150.h,
                    child: Column(
                      children: [
                        ListTitleUploadPicProfile(
                          uploadimage: uploadimage,
                          source: ImageSource.gallery,
                          title: 'Gallery',
                          icon: Icons.image_outlined,
                        ),
                        ListTitleUploadPicProfile(
                          uploadimage: uploadimage,
                          source: ImageSource.camera,
                          title: 'Camera',
                          icon: Icons.camera_alt_outlined,
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Center(
                child: ClipOval(
                  child: Container(
                    width: 100.w,
                    height: 100.h,
                    color: Colors.grey[300],
                    child: uploadimage.selectedImage == null
                        ? Image.asset(
                            "assets/image/OIP.jpeg",
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(uploadimage.selectedImage!.path),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),
            spaceH(20),
            const Center(child: Text("(optional)")),
          ],
        );
      },
    );
  }
}
