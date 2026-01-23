part of 'details_cubit.dart';

sealed class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

final class DetailsInitial extends DetailsState {}

final class DetailsLoading extends DetailsState {}

final class DetailsSuccess extends DetailsState {
  final ToppingsModel toppingsModel;
  const DetailsSuccess(this.toppingsModel);
}

final class DetailsFailure extends DetailsState {
  final String err;
  const DetailsFailure(this.err);
}
final class SideOptionsLoading extends DetailsState {}

final class SideOptionsSuccess extends DetailsState {
  final ToppingsModel toppingsModel;
  const SideOptionsSuccess(this.toppingsModel);
}

final class SideOptionsFailure extends DetailsState {
  final String err;
  const SideOptionsFailure(this.err);
}

