part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final AuthModel profilemodel;

  const ProfileSuccess(this.profilemodel);
}

final class ImageSuccess extends ProfileState {
  final XFile picImage;

  const ImageSuccess(this.picImage);
}

final class ProfileFailure extends ProfileState {
  final String err;

  const ProfileFailure(this.err);
}
