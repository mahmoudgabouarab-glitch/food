import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/features/profile/presentation/view_model/updata_profile/updata_profile_cubit.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UpdataAvatar extends StatelessWidget {
  const UpdataAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpdataProfileCubit>();
    final picker = ImagePicker();

    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Center(
        child: InkWell(
          onTap: () async {
            final image = await picker.pickImage(source: ImageSource.gallery);

            if (image == null) return;

            final croppedImage = await ImageCropper().cropImage(
              sourcePath: image.path,
              aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
              compressQuality: 85,
              uiSettings: [
                AndroidUiSettings(
                  toolbarTitle: 'Crop Avatar',
                  toolbarColor: AppColor.primary,
                  toolbarWidgetColor: Colors.white,
                  hideBottomControls: false,
                  lockAspectRatio: true,
                  cropStyle: CropStyle.circle,
                  
                ),
                IOSUiSettings(
                  title: 'Crop Avatar',
                  aspectRatioLockEnabled: true,
                  cropStyle: CropStyle.circle,
                ),
              ],
            );

            if (croppedImage != null) {
              cubit.updateAvatar(croppedImage);
            }
          },
          child: Text("Updata Avatar", style: Styles.s16_500),
        ),
      ),
    );
  }
}
