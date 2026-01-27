import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/widgets/custom_loading.dart';
import 'package:food/core/widgets/custom_snakbar.dart';
import 'package:food/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:food/features/home/presentation/view_model/add_to_cart_cubit/add_to_cart_cubit.dart';

class AddToCartListener extends StatelessWidget {
  const AddToCartListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddToCartCubit, AddToCartState>(
      listener: (context, state) {
        if (state is AddToCartLoading) {
          showDialog(
            context: context,
            builder: (context) => Center(child: CustomLoading(size: 20)),
          );
        }

        if (state is AddToCartSuccess) {
          context.popPage();
          CustomSnackBar.show(
            context,
            message: state.addToCartModel,
            type: SnackBarType.success,
          );
           context.read<CartCubit>().getCart();
        }
        if (state is AddToCartFailure) {
          CustomSnackBar.show(
            context,
            message: state.err,
            type: SnackBarType.error,
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
