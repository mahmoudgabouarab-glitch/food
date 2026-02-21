import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/features/cart/data/model/get_cart_model/get_cart_response.dart';
import 'package:food/features/cart/presentation/view/widgets/order/cash_card.dart';
import 'package:food/features/cart/presentation/view/widgets/order/order_action.dart';
import 'package:food/features/cart/presentation/view/widgets/order/order_bloc.dart';
import 'package:food/features/cart/presentation/view/widgets/order/visa_card.dart';
import 'package:food/generated/locale_keys.g.dart';

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
        title: Text(LocaleKeys.orderSummary.tr()),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              spaceH(15),
              _buildRowOrder(LocaleKeys.order.tr(), "\$$totalPrice"),
              _buildRowOrder(LocaleKeys.tax.tr(), "\$15"),
              _buildRowOrder(LocaleKeys.delivery.tr(), "\$5"),
              const Divider(),
              spaceH(20),
              _buildRowOrder(LocaleKeys.total.tr(), "\$${totalPrice + 15 + 5}"),
              spaceH(10),
              _buildRowOrder(
                LocaleKeys.estimatedDeliveryTime.tr(),
                LocaleKeys.deliveryTimeRange.tr(),
              ),
              spaceH(40),
              Text(LocaleKeys.paymentMethods.tr()),
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
