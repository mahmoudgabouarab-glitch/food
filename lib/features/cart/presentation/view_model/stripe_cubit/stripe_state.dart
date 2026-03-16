part of 'stripe_cubit.dart';

sealed class StripeState extends Equatable {
  const StripeState();

  @override
  List<Object> get props => [];
}

final class StripeInitial extends StripeState {}

final class StripeLoading extends StripeState {}

final class StripeSuccess extends StripeState {}

final class StripeFailure extends StripeState {
  final String errormessage;
  const StripeFailure(this.errormessage);
}
