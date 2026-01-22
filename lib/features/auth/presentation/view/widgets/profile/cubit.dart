import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/widgets/custom_snakbar.dart';
import 'package:food/features/auth/presentation/view_model/profile/profile_cubit.dart';

class ProfileCubitt extends StatelessWidget {
  const ProfileCubitt({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UpdataSuccess) {
          CustomSnackBar.show(
            context,
            message: state.updatamodel.message,
            type: SnackBarType.success,
          );
        }
        if (state is ProfileSuccess) {
          CustomSnackBar.show(
            context,
            message: state.profilemodel.message,
            type: SnackBarType.success,
          );
        }
        if (state is UpdataFailure) {
          CustomSnackBar.show(
            context,
            message: state.err,
            type: SnackBarType.error,
          );
        }
        if (state is ProfileFailure) {
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
