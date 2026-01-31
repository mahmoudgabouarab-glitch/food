import 'package:flutter_bloc/flutter_bloc.dart';

enum PaymentMethod { none, cash, visa }

class PaymentCubit extends Cubit<PaymentMethod> {
  PaymentCubit() : super(PaymentMethod.none);

  void selectCash() => emit(PaymentMethod.cash);
  void selectVisa() => emit(PaymentMethod.visa);
}
