import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/widgets/custom_button.dart';
import 'package:food/core/widgets/custom_text_filed.dart';
import 'package:food/features/auth/presentation/view_model/profile/profile_cubit.dart';
import 'package:food/features/auth/presentation/view_model/updata_profile/updata_profile_cubit.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: Image.asset("assets/image/visa.png", width: 100.w),
            title: const Text("Debit card"),
            subtitle: const Text("3566 **** **** 0505"),
            trailing: Checkbox(value: true, onChanged: (_) {}),
          ),
        ),
        spaceH(25),
        SizedBox(
          width: 150.w,
          child: Btn(
            radius: 15,
            ontap: () {
              _buildBottomSheet(context);
            },
            child: const Center(child: Text("Edit Profile")),
          ),
        ),
      ],
    );
  }
}

Future<T?> _buildBottomSheet<T>(BuildContext context) {
  final cubitprofile = context.read<ProfileCubit>();
  final cubitupdate = context.read<UpdataProfileCubit>();
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
    ),
    builder: (_) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            spaceH(5),
            Center(
              child: Container(width: 75.w, height: 3.h, color: AppColor.btn),
            ),
            spaceH(30),
            _buildField("Name", cubitprofile.namecontrollar),
            spaceH(20),
            _buildField("Email", cubitprofile.emailcontrollar),
            spaceH(20),
            _buildField("Address", cubitprofile.addresscontrollar),
            spaceH(20),
            _buildField("Visa", cubitprofile.visacontrollar),
            Spacer(),
            SizedBox(
              width: 150.w,
              child: Btn(
                ontap: () {
                  context.popPage();
                  cubitupdate.updateProfileData(
                    name: cubitprofile.namecontrollar.text,
                    email: cubitprofile.emailcontrollar.text,
                    address: cubitprofile.addresscontrollar.text,
                    visa: cubitprofile.visacontrollar.text,
                  );
                },
                text: "Confirm",
                radius: 15,
              ),
            ),
            spaceH(60),
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
    hint: hint,
    inputFormatters: inputFormatters,
    controller: controller,
    textstyle: const TextStyle(color: Colors.white),
    fillcolor: AppColor.surface,
  );
}
