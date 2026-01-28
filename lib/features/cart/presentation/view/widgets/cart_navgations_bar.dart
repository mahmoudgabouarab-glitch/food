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
    return CustomBtnNavBar(
      text: 'Checkout',
      ontap: () => context.push(const OrderView()),
      title: '\$${item.totalPrice}',
    );
  }
}
