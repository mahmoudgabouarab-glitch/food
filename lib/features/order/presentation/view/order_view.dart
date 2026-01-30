import 'package:flutter/material.dart';
import 'package:food/features/order/presentation/view/widgets/order_body.dart';

class OrderView extends StatelessWidget {
  final double totalPrice;
  const OrderView({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return OrderBody(totalPrice: totalPrice);
  }
}
