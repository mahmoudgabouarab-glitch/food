import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food/core/utils/function.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/features/settings/presentation/view/widgets/settings/custom_list_title_sittings.dart';
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
              if (!isGuest) ...[
                const ListTitleProfileAvatar(),
                spaceH(20),
                const Divider(thickness: 1.5),
                spaceH(20),
              ],
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
