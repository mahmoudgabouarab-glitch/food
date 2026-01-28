import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CartSuccess state;
  const CartAppBar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text("My Cart"),
          spaceH(5),
          Text(
            "${state.getCartResponse.data.items.length} items",
            style: TextStyle(fontSize: 12.sp),
          ),
        ],
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
