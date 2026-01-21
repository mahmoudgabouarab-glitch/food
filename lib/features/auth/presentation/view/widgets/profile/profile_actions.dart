import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/widgets/custom_button.dart';
import 'package:food/features/auth/presentation/view/login_view.dart';
import 'package:food/features/auth/presentation/view_model/logout/logout_cubit.dart';
import 'package:food/features/auth/presentation/view_model/profile/profile_cubit.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    final logoutCubit = context.read<LogoutCubit>();

    return Column(
      children: [
        Card(
          child: ListTile(
            leading: Image.asset(
              "assets/image/visa.png",
              width: 100.w,
            ),
            title: const Text("Debit card"),
            subtitle: const Text("3566 **** **** 0505"),
            trailing: Checkbox(value: true, onChanged: (_) {}),
          ),
        ),
        SizedBox(height: 25.h),
        Row(
          children: [
            Expanded(
              child: Btn(
                radius: 15,
                text: "Edit Profile",
                ontap: () async {
                  await profileCubit.postUpdataProfile();
                  await profileCubit.getProfile();
                },
              ),
            ),
            SizedBox(width: 80.w),
            Expanded(
              child: Btn(
                radius: 15,
                text: "Log out",
                ontap: () async {
                  await logoutCubit.postLogout();
                  context.pushAndRemoveUntil(const LoginView());
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
