import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/order/data/model/order_request.dart';
import 'package:food/features/order/data/model/order_response.dart';
import 'package:food/features/order/data/repo/order_repo.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this._repo) : super(OrderInitial());
  final OrderRepo _repo;

  Future<void> postOrder(List<OrderItem> item) async {
    emit(OrderLoading());
    final response = await _repo.postOrder(OrderRequest(items: item));
    response.fold(
      (failure) => emit(OrderFailure(failure.errormessage)),
      (success) => emit(OrderSuccess(success)),
    );
  }
}
