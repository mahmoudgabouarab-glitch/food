import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/widgets/custom_loading.dart';
import 'package:food/core/widgets/custom_snakbar.dart';
import 'package:food/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:food/features/cart/presentation/view_model/remove_cart_cubit/remove_cart_cubit.dart';

class RemoveListener extends StatelessWidget {
  const RemoveListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RemoveCartCubit, RemoveCartState>(
      listener: (context, state) {
        switch (state) {
          case RemoveCartLoading():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  const Center(child: CustomLoading(size: 20)),
            );
            break;
          case RemoveCartSuccess():
            context.read<CartCubit>().getCart();
            context.popPage();
            CustomSnackBar.show(
              context,
              message: state.deleteCartResponse.message,
              type: SnackBarType.success,
            );
            break;
          case RemoveCartFailure():
            CustomSnackBar.show(
              context,
              message: state.errormessage,
              type: SnackBarType.error,
            );
            break;
          default:
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
