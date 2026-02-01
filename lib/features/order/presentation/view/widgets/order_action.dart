import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/widgets/custom_btn_nav_bar.dart';
import 'package:food/core/widgets/custom_snakbar.dart';
import 'package:food/features/cart/data/model/get_cart_model/get_cart_response.dart';
import 'package:food/features/order/data/model/order_request.dart';
import 'package:food/features/order/presentation/view_model/order_cubit/order_cubit.dart';
import 'package:food/features/order/presentation/view_model/payment_cubit/payment_cubit.dart';

class OrderAction extends StatelessWidget {
  final double totalPrice;
  final List<CartItem> cartItems;
  const OrderAction({
    super.key,
    required this.totalPrice,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBtnNavBar(
      ontap: ()  {
        final payment = context.read<PaymentCubit>().state;
        if (payment == PaymentMethod.none) {
          return CustomSnackBar.show(
            context,
            message: "Please select payment way",
            type: SnackBarType.error,
          );
        }
        final items = cartItems
            .map((item) => OrderItem.fromCartItem(item))
            .toList();
         context.read<OrderCubit>().postOrder(items);
       
      },
      title: "\$${totalPrice + 15 + 5}",
      text: "Checkout",
    );
  }
}
