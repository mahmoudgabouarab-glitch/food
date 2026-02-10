import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/generated/locale_keys.g.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.about_us.tr()), centerTitle: false),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(LocaleKeys.about_us_title.tr(), style: Styles.s18_600),
                spaceH(5),
                Text(LocaleKeys.about_us_subtitle1.tr(), style: Styles.s16_500),
                spaceH(10),
                Text(LocaleKeys.about_us_subtitle2.tr(), style: Styles.s16_500),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
