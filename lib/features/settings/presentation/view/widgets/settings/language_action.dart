import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/assets.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/features/settings/presentation/view/widgets/settings/custom_list_title_sittings.dart';
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
          PopupMenuItem(
            value: 'ar',
            child: _buildChildPopupItem(
              path: Assets.arabicflag,
              title: LocaleKeys.arabic.tr(),
            ),
          ),
          PopupMenuItem(
            value: 'en',
            child: _buildChildPopupItem(
              path: Assets.englishflag,
              title: LocaleKeys.english.tr(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildChildPopupItem({required String path, required String title}) {
  return Row(children: [SvgPicture.asset(path), spaceW(12), Text(title)]);
}
