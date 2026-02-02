import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/features/cart/presentation/view_model/payment_cubit/payment_cubit.dart';

class CashCard extends StatelessWidget {
  const CashCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<PaymentCubit>().selectCash(),
      child: Card(
        child: ListTile(
          leading: Image.asset(
            "assets/image/dollarbackgroundremoved.png",
            width: 100.w,
          ),
          title: const Text("Cash on Delivery"),
          trailing: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
            ),
            value: context.watch<PaymentCubit>().state == PaymentMethod.cash,
            checkColor: AppColor.textPrimary,
            activeColor: AppColor.primary,
            onChanged: (val) {
              if (val == true) {
                context.read<PaymentCubit>().selectCash();
              }
            },
          ),
        ),
      ),
    );
  }
}
