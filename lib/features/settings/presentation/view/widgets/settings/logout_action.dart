import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/utils/function.dart';
import 'package:food/core/widgets/custom_loading.dart';
import 'package:food/core/widgets/custom_snakbar.dart';
import 'package:food/features/auth/presentation/view/login_view.dart';
import 'package:food/features/auth/presentation/view_model/logout/logout_cubit.dart';
import 'package:food/features/settings/presentation/view/widgets/settings/custom_list_title_sittings.dart';
import 'package:food/generated/locale_keys.g.dart';

class LogoutAction extends StatelessWidget {
  const LogoutAction({super.key});

  @override
  Widget build(BuildContext context) {
    return isGuest
        ? CustomListTitleSittings(
            title: LocaleKeys.login.tr(),
            leading: const Icon(Icons.logout, color: AppColor.error),
            onTap: () => context.pushAndRemoveUntil(const LoginView()),
          )
        : BlocListener<LogoutCubit, LogoutState>(
            listener: (context, state) {
              switch (state) {
                case LogoutInitial():
                case LogoutLoading():
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) =>
                        const Center(child: CustomLoading(size: 20)),
                  );
                case LogoutSuccess():
                  context.popPage();
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
            child: CustomListTitleSittings(
              title: LocaleKeys.logout.tr(),
              leading: const Icon(Icons.logout, color: AppColor.error),
              onTap: () async {
                final cubit = context.read<LogoutCubit>();
                final result = await _showOkCancelAlertDialog(context);
                if (result == OkCancelResult.ok) {
                  await cubit.postLogout();
                }
              },
            ),
          );
  }
}

Future<OkCancelResult> _showOkCancelAlertDialog(BuildContext context) =>
    showOkCancelAlertDialog(
      context: context,
      title: LocaleKeys.logout.tr(),
      message: LocaleKeys.logout_alert.tr(),
      okLabel: LocaleKeys.ok.tr(),
      cancelLabel: LocaleKeys.cancel.tr(),
      isDestructiveAction: true,
    );
