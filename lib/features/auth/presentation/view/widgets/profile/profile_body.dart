import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/widgets/custom_button.dart';
import 'package:food/core/widgets/custom_text_filed.dart';
import 'package:food/features/auth/presentation/view_model/profile/profile_cubit.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final cubit = context.read<ProfileCubit>();
        return RefreshIndicator(
          displacement: 60,
          onRefresh: () async {
            await context.read<ProfileCubit>().getProfile();
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              scrolledUnderElevation: 0,
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
              ],
            ),
            body: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),

              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("object");
                      },
                      child: const Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 80,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    CustomTextFormFiled(
                      controller: cubit.namecontrollar,
                      textstyle: const TextStyle(color: Colors.white),
                      fillcolor: AppColor.surface,
                      labelText: "Name",
                      labelStyle: const TextStyle(
                        color: AppColor.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFormFiled(
                      controller: cubit.emailcontrollar,
                      textstyle: const TextStyle(color: Colors.white),
                      fillcolor: AppColor.surface,
                      labelText: "Email",
                      labelStyle: const TextStyle(
                        color: AppColor.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFormFiled(
                      controller: cubit.addresscontrollar,
                      textstyle: const TextStyle(color: Colors.white),
                      fillcolor: AppColor.surface,
                      labelText: "Address",
                      labelStyle: const TextStyle(
                        color: AppColor.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFormFiled(
                      controller: cubit.visacontrollar,
                      textstyle: const TextStyle(color: Colors.white),
                      fillcolor: AppColor.surface,
                      labelText: "Visa",
                      labelStyle: const TextStyle(
                        color: AppColor.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    const Divider(),
                    Card(
                      child: ListTile(
                        leading: Image.asset(
                          "assets/image/visa.png",
                          width: 100.w,
                        ),
                        title: const Text("Debit card"),
                        subtitle: const Text("3566 **** **** 0505"),
                        trailing: Checkbox(value: true, onChanged: (val) {}),
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Row(
                      children: [
                        Expanded(
                          child: Btn(
                            radius: 15,
                            text: "Edit Profile",
                            ontap: () {},
                          ),
                        ),
                        SizedBox(width: 80.w),
                        Expanded(
                          child: Btn(radius: 15, text: "Log out", ontap: () {}),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
