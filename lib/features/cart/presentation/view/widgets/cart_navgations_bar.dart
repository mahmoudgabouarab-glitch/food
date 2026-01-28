import 'package:flutter/widgets.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/widgets/custom_btn_nav_bar.dart';
import 'package:food/features/cart/data/model/get_cart_model/get_cart_response.dart';
import 'package:food/features/order/presentation/view/order_view.dart';

class CartNavgationBar extends StatelessWidget {
  final Data item;
  const CartNavgationBar({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var item in item.items) {
      total += item.price * item.quantity;
    }
    return CustomBtnNavBar(
      text: 'Checkout',
      ontap: () => context.push(const OrderView()),
      title: '\$${total.toStringAsFixed(2)}',
    );
  }
}
