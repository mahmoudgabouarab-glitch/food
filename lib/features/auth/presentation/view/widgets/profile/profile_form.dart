import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/widgets/custom_text_filed.dart';
import 'package:food/features/auth/presentation/view_model/profile/profile_cubit.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();

    return Column(
      children: [
        SizedBox(height: 30.h),
        _buildField("Name", cubit.namecontrollar),
        SizedBox(height: 20.h),
        _buildField("Email", cubit.emailcontrollar),
        SizedBox(height: 20.h),
        _buildField("Address", cubit.addresscontrollar),
        SizedBox(height: 20.h),
        _buildField(
          "Visa",
          cubit.visacontrollar,
          inputFormatters: [CardNumberFormatter()],
        ),
        SizedBox(height: 20.h),
        const Divider(),
      ],
    );
  }

  Widget _buildField(
    String label,
    TextEditingController controller, {
    List<TextInputFormatter>? inputFormatters,
  }) {
    return CustomTextFormFiled(
      inputFormatters: inputFormatters,
      controller: controller,
      textstyle: const TextStyle(color: Colors.white),
      fillcolor: AppColor.surface,
      labelText: label,
      labelStyle: const TextStyle(
        color: AppColor.primary,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );
  }
}

// format card number
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
