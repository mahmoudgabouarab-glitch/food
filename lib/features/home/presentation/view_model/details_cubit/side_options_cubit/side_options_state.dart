part of 'side_options_cubit.dart';

sealed class SideOptionsState extends Equatable {
  const SideOptionsState();

  @override
  List<Object> get props => [];
}

final class SideOptionsInitial extends SideOptionsState {}

final class SideOptionsLoading extends SideOptionsState {}

final class SideOptionsSuccess extends SideOptionsState {
  final SideOptionsModel sideOptionsModel;
  const SideOptionsSuccess(this.sideOptionsModel);
  @override
  List<Object> get props => [sideOptionsModel];
}

final class SideOptionsFailure extends SideOptionsState {
  final String err;
  const SideOptionsFailure(this.err);
  @override
  List<Object> get props => [err];
}
