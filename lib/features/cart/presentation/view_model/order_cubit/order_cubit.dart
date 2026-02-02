import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/cart/data/model/order_model/order_request.dart';
import 'package:food/features/cart/data/model/order_model/order_response.dart';
import 'package:food/features/cart/data/repo/cart_repo.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this._repo) : super(OrderInitial());
  final CartRepo _repo;

  Future<void> postOrder(List<OrderItem> item) async {
    emit(OrderLoading());
    final response = await _repo.postOrder(OrderRequest(items: item));
    response.fold(
      (failure) => emit(OrderFailure(failure.errormessage)),
      (success) => emit(OrderSuccess(success)),
    );
  }
}
