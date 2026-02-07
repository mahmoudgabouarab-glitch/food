import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/utils/styles.dart';

class ItemOfFavorite extends StatelessWidget {
  const ItemOfFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: Row(
          children: [
            Container(
              height: 70.h,
              width: 70.w,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 80, 79, 78),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            spaceW(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Item name",
                  style: Styles.s16_500.copyWith(color: AppColor.primary),
                ),
                spaceH(5),
                Text(
                  "Item description",
                  style: Styles.s14_500.copyWith(color: AppColor.textSecondary),
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () async {
                final result = await _showOkCancelAlertDialog(context);
                if (result == OkCancelResult.ok) {
                  //await cartCubit.removeCart(id: item.itemId.toString());
                }
              },
              child: const Icon(Icons.close, color: AppColor.error),
            ),
          ],
        ),
      ),
    );
  }
}

Future<OkCancelResult> _showOkCancelAlertDialog(BuildContext context) =>
    showOkCancelAlertDialog(
      context: context,
      title: "Remove Item",
      message: "Are you sure you want to remove this item?",
      okLabel: "Ok",
      cancelLabel: "Cancel",
      isDestructiveAction: true,
    );
