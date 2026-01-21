import 'package:flutter/material.dart';
import 'package:food/features/order_history/presentation/view/widgets/item_order_history.dart';

class OrderHistoryBody extends StatelessWidget {
  const OrderHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ItemOrderHistory();
        },
      ),
    );
  }
}
