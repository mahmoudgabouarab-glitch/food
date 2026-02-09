import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/features/settings/presentation/view/widgets/settings/language_action.dart';
import 'package:food/features/settings/presentation/view/widgets/settings/logout_action.dart';
import 'package:food/features/settings/presentation/view/widgets/settings/list_title_profile_avatar.dart';
import 'package:food/generated/locale_keys.g.dart';

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
              const ListTitleProfileAvatar(),
              spaceH(20),
              const Divider(thickness: 1),
              spaceH(20),
              const LanguageAction(),
              CustomListTitleSittings(
                title: LocaleKeys.theme.tr(),
                icon: Icons.dark_mode,
                onTap: () {},
              ),
              CustomListTitleSittings(
                title: LocaleKeys.about_us.tr(),
                icon: Icons.help,
                onTap: () {},
              ),
              CustomListTitleSittings(
                title: LocaleKeys.contact_us.tr(),
                icon: Icons.info,
                onTap: () {},
              ),
              const LogoutAction(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTitleSittings extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget? leading;
  final void Function()? onTap;
  final Color? color;
  final Widget? trailing;
  const CustomListTitleSittings({
    super.key,
    required this.title,
    this.icon,
    this.leading,
    this.onTap,
    this.color,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: Card(
          margin: EdgeInsets.zero,
          child: ListTile(
            leading: leading ?? Icon(icon, color: color ?? AppColor.primary),
            title: Text(title),
            trailing: trailing,
          ),
        ),
      ),
    );
  }
}
