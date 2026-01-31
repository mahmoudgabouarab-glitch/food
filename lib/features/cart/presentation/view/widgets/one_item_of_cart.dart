import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/features/cart/data/model/get_cart_model/get_cart_response.dart';
import 'package:food/features/cart/presentation/view/widgets/remove_listener.dart';
import 'package:food/features/cart/presentation/view_model/remove_cart_cubit/remove_cart_cubit.dart';

class OneItemOfCart extends StatelessWidget {
  const OneItemOfCart({super.key, required this.item});
  final CartItem item;
  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<RemoveCartCubit>();
    final topppings = item.toppings.isEmpty
        ? ""
        : item.toppings.map((e) => e.name).join(' | ');
    final sideOptions = item.sideOptions.isEmpty
        ? ""
        : item.sideOptions.map((e) => e.name).join(' | ');
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedNetworkImage(
              imageUrl: item.image,
              height: 100.h,
              width: 100.w,
            ),
            spaceW(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () async {
                        final result = await _showOkCancelAlertDialog(context);
                        if (result == OkCancelResult.ok) {
                          await cartCubit.removeCart(
                            id: item.itemId.toString(),
                          );
                        }
                      },
                      child: Icon(Icons.close, color: AppColor.error),
                    ),
                  ),
                  spaceH(8),
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary,
                    ),
                  ),
                  if (topppings.isNotEmpty) ...[
                    spaceH(4),
                    Text(
                      "Toppings:",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColor.textPrimary,
                      ),
                    ),
                    Text(
                      topppings,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.textSecondary,
                      ),
                    ),
                    spaceH(8),
                    Row(
                      children: List.generate(
                        item.toppings.length,
                        (index) => Container(
                          margin: EdgeInsets.only(right: 8.w),
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                item.toppings[index].image,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  if (sideOptions.isNotEmpty) ...[
                    spaceH(4),
                    Text(
                      "Side Options:",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColor.textPrimary,
                      ),
                    ),
                    Text(
                      sideOptions,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.textSecondary,
                      ),
                    ),
                    spaceH(8),
                    Row(
                      children: List.generate(
                        item.sideOptions.length,
                        (index) => Container(
                          margin: EdgeInsets.only(right: 8.w),
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                item.sideOptions[index].image,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    spaceH(4),
                  ],
                  Text(
                    "\$${item.price.toString()}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.green[400],
                    ),
                  ),
                  RemoveListener(),
                ],
              ),
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
