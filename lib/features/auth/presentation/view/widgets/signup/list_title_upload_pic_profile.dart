
import 'package:flutter/material.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/features/auth/presentation/view_model/signup/signup_cubit.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ListTitleUploadPicProfile extends StatelessWidget {
  final SignupCubit uploadimage;
  final ImageSource source;
  final String title;
  final IconData icon;
  
  const ListTitleUploadPicProfile({
    super.key,
    required this.uploadimage,
    required this.source,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () async {
        var image = await picker.pickImage(source: source);
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
          uploadimage.pickImage(croppedImage);
        }
      },
    );
  }
}
