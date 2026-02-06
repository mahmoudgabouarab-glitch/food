part of 'order_history_cubit.dart';

sealed class OrderHistoryState extends Equatable {
  const OrderHistoryState();

  @override
  List<Object> get props => [];
}

final class OrderHistoryInitial extends OrderHistoryState {}

final class OrderHistoryLoading extends OrderHistoryState {}

final class OrderHistorySuccess extends OrderHistoryState {
  final OrderHistoryModel orderHistoryModel;
  const OrderHistorySuccess(this.orderHistoryModel);
  @override
  List<Object> get props => [orderHistoryModel];
}

final class OrderHistoryError extends OrderHistoryState {
  final String err;
  const OrderHistoryError(this.err);
  @override
  List<Object> get props => [err];
}
