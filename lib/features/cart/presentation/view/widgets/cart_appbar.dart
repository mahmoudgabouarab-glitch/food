import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/widgets/custom_btn_nav_bar.dart';
import 'package:food/features/auth/presentation/view_model/profile/profile_cubit.dart';
import 'package:food/features/cart/data/model/get_cart_model/get_cart_response.dart';
import 'package:food/features/order/presentation/view/order_view.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {

  final Data item;
  const CartAppBar({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var item in item.items) {
      total += item.price * item.quantity;
    }
    return AppBar(
      title: CustomBtnNavBar(
        horizontal: 0,
        text: 'Checkout',
        ontap: () => context.push(
          BlocProvider.value(
            value: context.read<ProfileCubit>(),
            child: OrderView(totalPrice: total, cartItems: item.items,),
          ),
        ),
        title: '  \$$total',
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
