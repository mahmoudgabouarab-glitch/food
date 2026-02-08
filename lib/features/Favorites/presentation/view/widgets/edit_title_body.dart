import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/network/cache_helper.dart';
import 'package:food/core/network/cache_keys.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/core/widgets/custom_button.dart';
import 'package:food/core/widgets/custom_text_filed.dart';

class EditTitleBody extends StatelessWidget {
  const EditTitleBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(centerTitle: false, title: const Text("Edit title")),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _buildField("Enter title", controller),
                spaceH(30),
                Btn(
                  ontap: () async {
                    if (!formKey.currentState!.validate()) return;
                    await CacheHelper.saveData(
                      key: CacheKeys.favoritesTitle,
                      value: controller.text,
                    );
                    context.popPage();
                  },
                  radius: 20,
                  text: "Save",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildField(String label, TextEditingController controller) {
  return CustomTextFormFiled(
    maxLength: 30,
    controller: controller,
    validator: (value) {
      if (value == null || value.isEmpty || value.trim().isEmpty) {
        return 'Title is required';
      }
      return null;
    },
    textstyle: const TextStyle(color: Colors.white),
    fillcolor: AppColor.surface,
    labelText: label,
    labelStyle: Styles.s14_700.copyWith(color: AppColor.primary),
  );
}
