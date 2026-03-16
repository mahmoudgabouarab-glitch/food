import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/cart/data/repo/cart_repo.dart';

part 'stripe_state.dart';

class StripeCubit extends Cubit<StripeState> {
  StripeCubit(this._repo) : super(StripeInitial());
  final CartRepo _repo;

  Future<void> payment({required int amount}) async {
    emit(StripeLoading());
    final result = await _repo.payment(amount: amount);
    result.fold(
            (failure) => emit(StripeFailure(failure.errormessage)),
      (success) => emit(StripeSuccess()),
    );
  }
}
