import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/features/cart/data/model/get_cart_model/get_cart_response.dart';
import 'package:food/features/order/presentation/view/widgets/cash_card.dart';
import 'package:food/features/order/presentation/view/widgets/order_action.dart';
import 'package:food/features/order/presentation/view/widgets/order_bloc.dart';
import 'package:food/features/order/presentation/view/widgets/visa_card.dart';

class OrderBody extends StatelessWidget {
  final double totalPrice;
  final List<CartItem> cartItems;
  const OrderBody({
    super.key,
    required this.totalPrice,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: OrderAction(
        totalPrice: totalPrice,
        cartItems: cartItems,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: const Text("Order Summary"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              spaceH(15),
              _buildRowOrder("Order", "\$$totalPrice"),
              _buildRowOrder("Tax", "\$15"),
              _buildRowOrder("Delivery", "\$5"),
              const Divider(),
              spaceH(20),
              _buildRowOrder("Total", "\$${totalPrice + 15 + 5}"),
              spaceH(10),
              _buildRowOrder("Estimated delivery time", "15 - 30 mins"),
              spaceH(40),
              const Text("Payment methods"),
              spaceH(20),
              const CashCard(),
              spaceH(20),
              const VisaCard(),
              const OrderBloc(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildRowOrder(String title, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title), Text(value)],
    ),
  );
}
