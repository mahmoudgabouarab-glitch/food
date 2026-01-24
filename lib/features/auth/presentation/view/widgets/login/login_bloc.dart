import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/widgets/custom_snakbar.dart';
import 'package:food/features/auth/presentation/view_model/login/login_cubit.dart';
import 'package:food/features/main_layout.dart';

class LogInBloc extends StatelessWidget {
  const LogInBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(color: AppColor.primary),
            ),
          );
        } else {
          context.popPage();
          if (state is LoginSuccess) {
            CustomSnackBar.show(
              context,
              message: state.loginModel.message,
              type: SnackBarType.success,
            );
            context.pushReplacement(const MainLayout());
          }
          if (state is LoginFailure) {
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
