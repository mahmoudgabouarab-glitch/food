import 'package:flutter/material.dart';
import 'package:food/core/utils/function.dart';
import 'package:food/core/widgets/custom_guest_widget.dart';
import 'package:food/features/order_history/presentation/view/widgets/order_history_body.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return isGuest ? const CustomGuestWidget() : const OrderHistoryBody();
  }
}
