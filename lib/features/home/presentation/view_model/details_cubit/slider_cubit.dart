import 'package:flutter_bloc/flutter_bloc.dart';

class SpicyCubit extends Cubit<double> {
  SpicyCubit() : super(0.5);

  void changeSpicy(double value) => emit(value);
}
