import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/features/auth/presentation/view_model/logout/logout_cubit.dart';
import 'package:food/features/profile/presentation/view/widgets/settings/list_title_profile_avatar.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              ListTitleProfileAvatar(),
              spaceH(20),
              Divider(thickness: 1),
              spaceH(20),
              _buildListTitleSittings(
                title: 'language',
                icon: Icons.language,
                onTap: () {},
              ),
              _buildListTitleSittings(
                title: 'theme',
                icon: Icons.dark_mode,
                onTap: () {},
              ),
              _buildListTitleSittings(
                title: 'help',
                icon: Icons.help,
                onTap: () {},
              ),
              _buildListTitleSittings(
                title: 'contact us',
                icon: Icons.info,
                onTap: () {},
              ),
              _buildListTitleSittings(
                color: AppColor.error,
                title: 'logout',
                icon: Icons.logout,
                onTap: () {
                  context.read<LogoutCubit>().postLogout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildListTitleSittings({
  required String title,
  required IconData icon,
  required VoidCallback onTap,
  Color? color,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Card(
        margin: EdgeInsets.zero,
        child: ListTile(
          leading: Icon(icon, color: color ?? AppColor.primary),
          title: Text(title),
        ),
      ),
    ),
  );
}
