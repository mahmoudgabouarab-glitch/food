
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/features/order_history/presentation/view_model/cubit/order_history_cubit.dart';

class OrderHistoryAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final OrderHistorySuccess state;
  const OrderHistoryAppBar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const Text("Order History"),
          const Spacer(),
          Text(
            "All Orders (${state.orderHistoryModel.data!.length})",
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
