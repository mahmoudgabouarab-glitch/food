import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/features/auth/presentation/view_model/profile/profile_cubit.dart';

class VisaCard extends StatefulWidget {
  const VisaCard({super.key});

  @override
  State<VisaCard> createState() => _VisaCardState();
}

class _VisaCardState extends State<VisaCard> {
  bool isSelectedVisa = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          final visa = state.profilemodel.data.visa;
          if (visa == null || visa.isEmpty) {
            return const SizedBox.shrink();
          }
          return Card(
            child: ListTile(
              leading: Image.asset("assets/image/visa.png", width: 100.w),
              title: const Text("Debit card"),
              subtitle: Text(visa),
              trailing: Checkbox(
                value: isSelectedVisa,
                checkColor: AppColor.textPrimary,
                activeColor: AppColor.primary,
                onChanged: (val) {
                  setState(() {
                    isSelectedVisa = val!;
                  });
                },
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
