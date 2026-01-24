import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/widgets/custom_snakbar.dart';
import 'package:food/features/auth/presentation/view_model/signup/signup_cubit.dart';
import 'package:food/features/main_layout.dart';

class SignupBloc extends StatelessWidget {
  const SignupBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(color: AppColor.primary),
            ),
          );
        } else {
          context.popPage();
          if (state is SignupSuccess) {
            context.pushReplacement(const MainLayout());
            CustomSnackBar.show(
              context,
              message: state.signupModel.message,
              type: SnackBarType.success,
            );
          }
          if (state is SignupFailure) {
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
