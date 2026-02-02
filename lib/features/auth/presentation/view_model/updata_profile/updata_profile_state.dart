part of 'updata_profile_cubit.dart';

sealed class UpdataProfileState extends Equatable {
  const UpdataProfileState();

  @override
  List<Object> get props => [];
}

final class UpdataProfileInitial extends UpdataProfileState {}

final class UpdataProfileLoading extends UpdataProfileState {}

final class UpdataProfileSuccess extends UpdataProfileState {
  final ProfileModel updatamodel;

  const UpdataProfileSuccess(this.updatamodel);
  @override
  List<Object> get props => [updatamodel];
}

final class UpdataProfileFailure extends UpdataProfileState {
  final String err;

  const UpdataProfileFailure(this.err);
  @override
  List<Object> get props => [err];
}
