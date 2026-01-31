import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/widgets/custom_loading.dart';
import 'package:food/features/order_history/presentation/view/widgets/item_order_history.dart';
import 'package:food/features/order_history/presentation/view_model/cubit/order_history_cubit.dart';

class OrderHistoryBody extends StatelessWidget {
  const OrderHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
      builder: (context, state) {
        return state is OrderHistorySuccess
            ? Scaffold(
                appBar: AppBar(
                  title: Row(
                    children: [
                      Text("Order History"),
                      Spacer(),
                      Text(
                        "All Orders (${state.orderHistoryModel.data!.length})",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  centerTitle: false,
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.orderHistoryModel.data!.length,
                    itemBuilder: (context, index) {
                      return ItemOrderHistory(
                        listOfOrderHistory:
                            state.orderHistoryModel.data![index],
                      );
                    },
                  ),
                ),
              )
            : const Center(child: CustomLoading(size: 20));
      },
    );
  }
}
