import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/widgets/custom_loading.dart';
import 'package:food/core/widgets/custom_snakbar.dart';
import 'package:food/features/auth/presentation/view_model/profile/profile_cubit.dart';
import 'package:food/features/auth/presentation/view_model/updata_profile/updata_profile_cubit.dart';

class ProfileListener extends StatelessWidget {
  const ProfileListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdataProfileCubit, UpdataProfileState>(
      listener: (context, state) {
        if (state is UpdataProfileLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) =>
                Center(child: CustomLoading(color: AppColor.btn, size: 20)),
          );
        }
        if (state is UpdataProfileSuccess) {
          context.read<ProfileCubit>().getProfile();
          context.popPage();
          CustomSnackBar.show(
            context,
            message: state.updatamodel.message,
            type: SnackBarType.success,
          );
        }
        if (state is UpdataProfileFailure) {
          context.popPage();
          CustomSnackBar.show(
            context,
            message: state.err,
            type: SnackBarType.error,
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
