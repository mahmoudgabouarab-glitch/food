import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/features/order_history/data/model/order/list_of_order_history.dart';
import 'package:food/generated/locale_keys.g.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CachedNetworkImage(
                imageUrl: listOfOrderHistory.productImage,
                height: 100.h,
              ),
            ),
             Text(
              LocaleKeys.confirmed.tr(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(),
            _buildOrderHistoryItem(LocaleKeys.date.tr(), date),
            const Divider(),
            _buildOrderHistoryItem(LocaleKeys.time.tr(), time),
            const Divider(),
            _buildOrderHistoryItem(
              LocaleKeys.total_price.tr(),
              "${double.parse(listOfOrderHistory.totalPrice) + 15 + 5}\$",
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

Widget _buildOrderHistoryItem(String title, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [Text(title), Text(value)],
  );
}
