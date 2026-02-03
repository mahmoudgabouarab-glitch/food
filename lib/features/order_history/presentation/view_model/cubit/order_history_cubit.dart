import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/order_history/data/model/order/order.history.model.dart';
import 'package:food/features/order_history/data/repo/order_histoy_repo.dart';

part 'order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit(this._repo) : super(OrderHistoryInitial());
  final OrderHistoryRepo _repo;
  Future<void> getOrderHistory() async {
    emit(OrderHistoryLoading());
    final result = await _repo.getOrderHistory();
    result.fold(
      (failure) => emit(
        OrderHistoryError(failure.errormessage, statusCode: failure.statusCode),
      ),
      (success) => emit(OrderHistorySuccess(success)),
    );
  }
}
