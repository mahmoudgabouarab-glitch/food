import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/widgets/custom_button.dart';
import 'package:food/features/home/presentation/view/widgets/product_item_stack.dart';

class ItemOrderHistory extends StatelessWidget {
  const ItemOrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProductItemStack(width: 100),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("data"), Text("data"), Text("data")],
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Btn(ontap: () {}, radius: 15, text: "Order Again", minWidth: 0),
          ],
        ),
      ),
    );
  }
}
