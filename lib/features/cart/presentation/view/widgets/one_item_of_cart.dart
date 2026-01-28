import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/widgets/custom_button.dart';
import 'package:food/features/cart/data/model/get_cart_model/get_cart_response.dart';
import 'package:food/features/cart/presentation/view/widgets/cart_item_stack.dart';
import 'package:food/features/cart/presentation/view/widgets/remove_listener.dart';
import 'package:food/features/cart/presentation/view_model/remove_cart_cubit/remove_cart_cubit.dart';

class OneItemOfCart extends StatelessWidget {
  const OneItemOfCart({super.key, required this.item});
  final CartItem item;
  @override
  Widget build(BuildContext context) {
    final topppings = item.toppings.isEmpty
        ? ""
        : item.toppings.map((e) => e.name).join(', ');
    final sideOptions = item.sideOptions.isEmpty
        ? ""
        : item.sideOptions.map((e) => e.name).join(', ');
    return Card(
      color: AppColor.primary,
      child: Padding(
        padding: EdgeInsets.only(right: 10.w, left: 10.w, bottom: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: CartItemStack(imageUrl: item.image)),
            Text(
              item.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
            spaceH(4),
            if (topppings.isNotEmpty) ...[
              spaceH(4),
              Text(
                "Toppings: $topppings",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13.sp),
              ),
            ],
            if (sideOptions.isNotEmpty) ...[
              spaceH(4),
              Text(
                "Side Options: $sideOptions",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13.sp),
              ),
            ],
            Text(
              "\$${item.price}",
              style: TextStyle(fontSize: 14.sp, color: Colors.white70),
            ),
            spaceH(10),
            Btn(
              ontap: () {
                context.read<RemoveCartCubit>().removeCart(
                  id: item.itemId.toString(),
                );
              },
              radius: 15,
              text: "Remove",
              color: AppColor.error,
            ),
            RemoveListener(),
          ],
        ),
      ),
    );
  }
}
