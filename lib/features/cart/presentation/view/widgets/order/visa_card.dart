import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/features/profile/presentation/view_model/profile/profile_cubit.dart';
import 'package:food/features/cart/presentation/view_model/payment_cubit/payment_cubit.dart';

class VisaCard extends StatelessWidget {
  const VisaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          final visa = state.profilemodel.data.visa;
          if (visa == null || visa.isEmpty) {
            return const SizedBox.shrink();
          }
          return GestureDetector(
            onTap: () => context.read<PaymentCubit>().selectVisa(),
            child: Card(
              child: ListTile(
                leading: Image.asset("assets/image/visa.png", width: 100.w),
                title: const Text("Debit card"),
                subtitle: Text(visa),
                trailing: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  value:
                      context.watch<PaymentCubit>().state == PaymentMethod.visa,
                  checkColor: AppColor.textPrimary,
                  activeColor: AppColor.primary,
                  onChanged: (val) {
                    if (val == true) {
                      context.read<PaymentCubit>().selectVisa();
                    }
                  },
                ),
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
