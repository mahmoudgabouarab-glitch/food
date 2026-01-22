import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/widgets/custom_button.dart';
import 'package:food/features/auth/presentation/view_model/profile/profile_cubit.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
   

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
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Btn(
              radius: 15,
              ontap: state is UpdataLoading
                  ? null
                  : () async {
                      await profileCubit.postUpdataProfile();
                    },
              child: state is UpdataLoading
                  ? Center(
                      child: CupertinoActivityIndicator(color: AppColor.btn),
                    )
                  : Text("Edit Profile"),
            );
          },
        ),
      ],
    );
  }
}
