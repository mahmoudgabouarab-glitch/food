part of 'signup_cubit.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final AuthModel signupModel;

  const SignupSuccess(this.signupModel);
}

final class SignupFailure extends SignupState {
  final String err;

  const SignupFailure(this.err);
}
final class ImageSuccess extends SignupState {
  final XFile picImage;

  const ImageSuccess(this.picImage);
}
