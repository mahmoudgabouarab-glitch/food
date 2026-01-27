import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/servise_locator.dart';
import 'package:food/features/cart/data/repo/cart_repo_impl.dart';
import 'package:food/features/cart/presentation/view/widgets/cart_body.dart';
import 'package:food/features/cart/presentation/view_model/cart_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(getIt<CartRepoImpl>())..getCart(),
      child: CartBody(),
    );
  }
}
