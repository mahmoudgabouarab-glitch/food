import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/core/widgets/custom_button.dart';
import 'package:food/core/widgets/custom_text_filed.dart';
import 'package:food/features/settings/presentation/view_model/profile/profile_cubit.dart';
import 'package:food/features/settings/presentation/view_model/updata_profile/updata_profile_cubit.dart';
import 'package:food/generated/locale_keys.g.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      child: Btn(
        radius: 15,
        ontap: () {
          _buildBottomSheet(context);
        },
        child: Center(child: Text(LocaleKeys.edite_profile.tr())),
      ),
    );
  }
}

Future<T?> _buildBottomSheet<T>(BuildContext context) {
  final cubitprofile = context.read<ProfileCubit>();
  final cubitupdate = context.read<UpdataProfileCubit>();
  return showModalBottomSheet(
    useSafeArea: true,
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
    ),
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.65,
        child: Column(
          children: [
            spaceH(8),
            Center(
              child: Container(width: 64.w, height: 4.h, color: AppColor.btn),
            ),
            spaceH(20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(LocaleKeys.name.tr(), style: Styles.s14_500),
                    spaceH(8),
                    _buildField(
                      LocaleKeys.name.tr(),
                      cubitprofile.namecontrollar,
                    ),
                    spaceH(20),
                    Text(LocaleKeys.email.tr(), style: Styles.s14_500),
                    spaceH(8),
                    _buildField(
                      LocaleKeys.email.tr(),
                      cubitprofile.emailcontrollar,
                    ),
                    spaceH(20),
                    Text(LocaleKeys.address.tr(), style: Styles.s14_500),
                    spaceH(8),
                    _buildField(
                      LocaleKeys.address.tr(),
                      cubitprofile.addresscontrollar,
                    ),
                    spaceH(30),
                    Center(
                      child: SizedBox(
                        width: 150.w,
                        child: Btn(
                          ontap: () {
                            context.popPage();
                            cubitupdate.updateProfileData(
                              name: cubitprofile.namecontrollar.text,
                              email: cubitprofile.emailcontrollar.text,
                              address: cubitprofile.addresscontrollar.text,
                            );
                          },
                          text: LocaleKeys.confirm.tr(),
                          radius: 15,
                        ),
                      ),
                    ),
                    spaceH(30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildField(
  String hint,
  TextEditingController controller, {
  List<TextInputFormatter>? inputFormatters,
}) {
  return CustomTextFormFiled(
    onTap: (_) => FocusManager,
    hint: hint,
    inputFormatters: inputFormatters,
    controller: controller,
    textstyle: const TextStyle(color: Colors.white),
    fillcolor: AppColor.surface,
  );
}

//format card number
class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text.replaceAll(' ', '');

    if (text.length > 16) return oldValue;

    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i % 4 == 0 && i != 0) buffer.write(' ');
      buffer.write(text[i]);
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
