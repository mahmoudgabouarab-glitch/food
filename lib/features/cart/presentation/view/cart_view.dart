import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/servise_locator.dart';
import 'package:food/core/utils/function.dart';
import 'package:food/core/widgets/custom_guest_widget.dart';
import 'package:food/features/cart/data/repo/cart_repo_impl.dart';
import 'package:food/features/cart/presentation/view/widgets/cart/cart_body.dart';
import 'package:food/features/cart/presentation/view_model/remove_cart_cubit/remove_cart_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RemoveCartCubit(getIt<CartRepoImpl>()),
      child: isGuest ? const CustomGuestWidget() : const CartBody(),
    );
  }
}
