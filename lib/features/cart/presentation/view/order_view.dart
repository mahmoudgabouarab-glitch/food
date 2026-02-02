import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/servise_locator.dart';
import 'package:food/features/cart/data/model/get_cart_model/get_cart_response.dart';
import 'package:food/features/cart/data/repo/cart_repo_impl.dart';
import 'package:food/features/cart/presentation/view/widgets/order/order_body.dart';
import 'package:food/features/cart/presentation/view_model/order_cubit/order_cubit.dart';
import 'package:food/features/cart/presentation/view_model/payment_cubit/payment_cubit.dart';

class OrderView extends StatelessWidget {
  final List<CartItem> cartItems;
  final double totalPrice;
  const OrderView({
    super.key,
    required this.totalPrice,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OrderCubit(getIt<CartRepoImpl>())),
        BlocProvider(create: (context) => PaymentCubit()),
      ],
      child: OrderBody(totalPrice: totalPrice, cartItems: cartItems),
    );
  }
}
