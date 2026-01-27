part of 'toppings_cubit.dart';

sealed class ToppingsState extends Equatable {
  const ToppingsState();

  @override
  List<Object?> get props => [];
}

final class ToppingsInitial extends ToppingsState {}

final class ToppingsLoading extends ToppingsState {}

final class ToppingsSuccess extends ToppingsState {
  final ToppingsModel toppingsModel;
  const ToppingsSuccess(this.toppingsModel);

  @override
  List<Object?> get props => [toppingsModel];
}

final class ToppingsFailure extends ToppingsState {
  final String err;
  const ToppingsFailure(this.err);

  @override
  List<Object?> get props => [err];
}
