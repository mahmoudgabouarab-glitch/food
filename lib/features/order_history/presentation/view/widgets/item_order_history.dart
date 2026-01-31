import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/features/order_history/data/model/order/datum.history.model.dart';

class ItemOrderHistory extends StatelessWidget {
  final ListOfOrderHistory listOfOrderHistory;
  const ItemOrderHistory({super.key, required this.listOfOrderHistory});

  @override
  Widget build(BuildContext context) {
    final createdAt = listOfOrderHistory.createdAt;
    final parts = createdAt.split(' ');

    final date = parts[0];
    final time = parts[1];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: listOfOrderHistory.productImage,
              height: 100.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("confirmed"), Text(date)],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("created_at"), Text(time)],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("total_price"),
                Text(listOfOrderHistory.totalPrice.toString()),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
