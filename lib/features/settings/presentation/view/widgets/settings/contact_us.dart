import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/assets.dart';
import 'package:food/generated/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.contact_us.tr()),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          children: [
            _buildContactUsTile(
              path: Assets.facebook,
              value: LocaleKeys.facebook.tr(),
              url: "https://www.facebook.com/share/1DQpJzxnPV/",
            ),
            _buildContactUsTile(
              path: Assets.twitter,
              value: LocaleKeys.twitter.tr(),
              url: "https://x.com/MA7MOUD2GOM3A?t=asaSE4HkLw4l8O_O34A8hw&s=09",
            ),
            _buildContactUsTile(
              path: Assets.insta,
              value: LocaleKeys.instagram.tr(),
              url:
                  "https://www.instagram.com/mahmoudgomaa69?igsh=MWIyNGYxZzNjY2FnNg==",
            ),
            _buildContactUsTile(
              path: Assets.whatsapp,
              value: LocaleKeys.whatsapp.tr(),
              url: "https://wa.me/qr/JQQJIXJTEHERN1",
            ),
            _buildContactUsTile(
              path: Assets.location,
              value: LocaleKeys.location.tr(),
              url: "https://maps.app.goo.gl/LhmesfKPxnKsayFn7",
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildContactUsTile({
  required String path,
  required String value,
  required String url,
}) {
  return GestureDetector(
    onTap: () async => await launchUrl(Uri.parse(url)),
    child: Card(
      child: ListTile(
        leading: SvgPicture.asset(
          path,
          colorFilter: const ColorFilter.mode(
            AppColor.primary,
            BlendMode.srcIn,
          ),
        ),
        title: Text(value),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
      ),
    ),
  );
}
