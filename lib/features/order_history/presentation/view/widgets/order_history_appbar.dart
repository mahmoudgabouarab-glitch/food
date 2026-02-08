import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/features/order_history/presentation/view_model/cubit/order_history_cubit.dart';
import 'package:food/generated/locale_keys.g.dart';

class OrderHistoryAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final OrderHistorySuccess state;
  const OrderHistoryAppBar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text(LocaleKeys.order_history.tr()),
          const Spacer(),
          SizedBox(
            width: 40.w,
            height: 40.h,
            child: Stack(
              children: [
                Center(child: Icon(Icons.shopify_sharp, size: 34.sp)),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 20.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: AppColor.error,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "${state.orderHistoryModel.data?.length ?? 0}",
                        style: Styles.s12_500.copyWith(
                          color: AppColor.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
