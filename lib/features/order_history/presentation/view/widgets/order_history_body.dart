import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/widgets/custom_loading.dart';
import 'package:food/features/order_history/presentation/view/widgets/item_order_history.dart';
import 'package:food/features/order_history/presentation/view/widgets/order_history_appbar.dart';
import 'package:food/features/order_history/presentation/view_model/cubit/order_history_cubit.dart';

class OrderHistoryBody extends StatelessWidget {
  const OrderHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
      builder: (context, state) {
        switch (state) {
          case OrderHistoryInitial():
            break;
          case OrderHistoryLoading():
            return const Center(child: CustomLoading(size: 20));
          case OrderHistorySuccess():
            return Scaffold(
              appBar: OrderHistoryAppBar(state: state),
              body: _buildItemOrderHistory(state),
            );
          case OrderHistoryError():
            return Center(child: Text(state.err));
        }
        return const SizedBox.shrink();
      },
    );
  }
}

Widget _buildItemOrderHistory(OrderHistorySuccess state) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: state.orderHistoryModel.data!.length,
      itemBuilder: (context, index) {
        return ItemOrderHistory(
          listOfOrderHistory: state.orderHistoryModel.data![index],
        );
      },
    ),
  );
}
