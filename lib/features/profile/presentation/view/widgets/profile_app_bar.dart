import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/widgets/custom_snakbar.dart';
import 'package:food/features/auth/presentation/view/login_view.dart';
import 'package:food/features/auth/presentation/view_model/logout/logout_cubit.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {
        switch (state) {
          case LogoutInitial():
            break;
          case LogoutLoading():
            break;
          case LogoutSuccess():
            context.pushAndRemoveUntil(const LoginView());
            CustomSnackBar.show(
              context,
              message: state.logoutModel.message,
              type: SnackBarType.success,
            );
          case LogoutFailure():
            CustomSnackBar.show(
              context,
              message: state.err,
              type: SnackBarType.error,
            );
        }
      },
      builder: (context, state) {
        final cubit = context.read<LogoutCubit>();
        return AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          actions: [
            IconButton(
              onPressed: state is LogoutLoading
                  ? null
                  : () async {
                      final result = await _showOkCancelAlertDialog(context);
                      if (result == OkCancelResult.ok) {
                        await cubit.postLogout();
                      }
                    },
              icon: state is LogoutLoading
                  ? const CupertinoActivityIndicator()
                  : const Icon(Icons.logout),
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

Future<OkCancelResult> _showOkCancelAlertDialog(BuildContext context) =>
    showOkCancelAlertDialog(
      context: context,
      title: "Logout",
      message: "Are you sure you want to logout?",
      okLabel: "Ok",
      cancelLabel: "Cancel",
      isDestructiveAction: true,
    );
