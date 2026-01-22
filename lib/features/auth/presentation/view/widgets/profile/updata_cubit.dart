import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/widgets/custom_snakbar.dart';
import 'package:food/features/auth/presentation/view_model/profile/profile_cubit.dart';

class UpdataCubit extends StatelessWidget {
  const UpdataCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) {
        return current is UpdataLoading ||
            current is UpdataSuccess ||
            current is UpdataFailure;
      },
      listener: (context, state) {
        if (state is UpdataLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(color: AppColor.primary),
            ),
          );
        } else {
          context.popPage();
          if (state is UpdataSuccess) {
            CustomSnackBar.show(
              context,
              message: state.updatamodel.message,
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
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
