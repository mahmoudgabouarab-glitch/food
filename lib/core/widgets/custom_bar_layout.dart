import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/function.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';

class CustomBarLayout extends StatelessWidget {
  const CustomBarLayout({
    super.key,
    this.stack = false,
    this.icon,
    required this.currentIndex,
    required this.index,
  });
  final bool? stack;
  final IconData? icon;
  final int currentIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    final isSelected = currentIndex == index;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 2.h,
          width: 49.w,
          decoration: BoxDecoration(
            color: isSelected ? AppColor.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        spaceH(14),
        Stack(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColor.primary : AppColor.textSecondary,
            ),
            if (stack == true && !isGuest) _iconBrightness(),
          ],
        ),
        spaceH(4),
      ],
    );
  }
}

Widget _iconBrightness() {
  return BlocBuilder<CartCubit, CartState>(
    builder: (context, state) {
      return state is CartSuccess && state.countOfItems > 0
          ? Positioned(
              right: 0,
              top: 0,
              child: Icon(
                Icons.brightness_1,
                size: 12.sp,
                color: AppColor.primary,
              ),
            )
          : const SizedBox.shrink();
    },
  );
}
