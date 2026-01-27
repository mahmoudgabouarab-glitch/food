import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/cart/data/model/get_cart_model/get_cart_response.dart';
import 'package:food/features/cart/data/repo/cart_repo.dart';

part 'remove_cart_state.dart';

class RemoveCartCubit extends Cubit<RemoveCartState> {
  RemoveCartCubit(this._repo) : super(RemoveCartInitial());
  final CartRepo _repo;

  Future<void> removeCart({required String id}) async {
    emit(RemoveCartLoading());
    final result = await _repo.deleteCart(id: id);
    result.fold(
      (failure) => emit(RemoveCartFailure(failure.errormessage)),
      (success) => emit(RemoveCartSuccess(success)),
    );
  }
}
