import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/features/auth/presentation/view_model/updata_profile/updata_profile_cubit.dart';
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
            if (image != null) {
              cubit.updateAvatar(image);
            }
          },
          child: Text("Updata Avatar", style: Styles.s16_500),
        ),
      ),
    );
  }
}
