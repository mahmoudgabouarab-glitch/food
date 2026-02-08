import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/core/widgets/custom_text_filed.dart';
import 'package:food/features/profile/presentation/view_model/profile/profile_cubit.dart';
import 'package:food/generated/locale_keys.g.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();

    return Column(
      children: [
        SizedBox(height: 30.h),
        _buildField(LocaleKeys.name.tr(), cubit.namecontrollar),
        SizedBox(height: 20.h),
        _buildField(LocaleKeys.email.tr(), cubit.emailcontrollar),
        SizedBox(height: 20.h),
        _buildField(LocaleKeys.address.tr(), cubit.addresscontrollar),
        SizedBox(height: 20.h),
        _buildField(LocaleKeys.visa.tr(), cubit.visacontrollar),
        SizedBox(height: 20.h),
      ],
    );
  }
}

Widget _buildField(
  String label,
  TextEditingController controller, {
  List<TextInputFormatter>? inputFormatters,
}) {
  return CustomTextFormFiled(
    readOnly: true,
    inputFormatters: inputFormatters,
    controller: controller,
    textstyle: const TextStyle(color: Colors.white),
    fillcolor: AppColor.surface,
    labelText: label,
    labelStyle: Styles.s14_700.copyWith(color: AppColor.primary),
  );
}
