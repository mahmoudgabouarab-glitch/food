import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/servise_locator.dart';
import 'package:food/features/order_history/data/repo/order_history_repo_impl.dart';
import 'package:food/features/order_history/presentation/view/widgets/order_history_body.dart';
import 'package:food/features/order_history/presentation/view_model/cubit/order_history_cubit.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OrderHistoryCubit(getIt<OrderHistoryRepoImpl>())..getOrderHistory(),
      child: const OrderHistoryBody(),
    );
  }
}
