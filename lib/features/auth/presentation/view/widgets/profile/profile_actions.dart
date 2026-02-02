import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/widgets/custom_button.dart';
import 'package:food/features/auth/presentation/view_model/updata_profile/updata_profile_cubit.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpdataProfileCubit>();

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
        SizedBox(height: 25.h),
        BlocBuilder<UpdataProfileCubit, UpdataProfileState>(
          builder: (context, state) {
            return Btn(
              radius: 15,
              ontap: state is UpdataProfileLoading
                  ? null
                  : () async {
                      //  await cubit.postUpdataProfile();
                    },
              child: state is UpdataProfileLoading
                  ? const Center(
                      child: CupertinoActivityIndicator(color: AppColor.btn),
                    )
                  : const Text("Edit Profile"),
            );
          },
        ),
      ],
    );
  }
}
