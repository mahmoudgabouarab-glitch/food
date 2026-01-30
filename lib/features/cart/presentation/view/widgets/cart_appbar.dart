import 'package:flutter/material.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/widgets/custom_btn_nav_bar.dart';
import 'package:food/features/cart/data/model/get_cart_model/get_cart_response.dart';
import 'package:food/features/order/presentation/view/order_view.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Data item;
  const CartAppBar({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var item in item.items) {
      total += item.price * item.quantity;
    }
    return AppBar(
      title: CustomBtnNavBar(
        horizontal: 0,
        text: 'Checkout',
        ontap: () => context.push(OrderView(totalPrice: total)),
        title: '  \$$total',
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
