import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/widgets/custom_snakbar.dart';
import 'package:food/features/order/presentation/view_model/order_cubit/order_cubit.dart';
import 'package:food/features/order_history/presentation/view_model/cubit/order_history_cubit.dart';

class OrderBloc extends StatelessWidget {
  const OrderBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is OrderLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(color: AppColor.primary),
            ),
          );
        } else {
          context.popPage();
          if (state is OrderSuccess) {
            CustomSnackBar.show(
              context,
              message: state.orderResponse.message,
              type: SnackBarType.success,
            );
            context.read<OrderHistoryCubit>().getOrderHistory();
          }
          if (state is OrderFailure) {
            CustomSnackBar.show(
              context,
              message: state.err,
              type: SnackBarType.error,
            );
          }
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
