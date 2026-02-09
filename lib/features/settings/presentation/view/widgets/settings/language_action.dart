import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food/features/settings/presentation/view/widgets/settings/settings_body.dart';
import 'package:food/generated/locale_keys.g.dart';

class LanguageAction extends StatelessWidget {
  const LanguageAction({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListTitleSittings(
      title: LocaleKeys.language.tr(),
      icon: Icons.language,
      trailing: PopupMenuButton<String>(
        icon: const Icon(Icons.keyboard_arrow_down, size: 26),
        onSelected: (value) {
          if (value == 'ar') {
            context.setLocale(const Locale('ar'));
          } else {
            context.setLocale(const Locale('en'));
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(value: 'ar', child: Text(LocaleKeys.arabic.tr())),
          PopupMenuItem(value: 'en', child: Text(LocaleKeys.english.tr())),
        ],
      ),
    );
  }
}
