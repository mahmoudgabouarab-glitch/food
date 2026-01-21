part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final AuthModel loginModel;

  const LoginSuccess(this.loginModel);
}

final class LoginFailure extends LoginState {
  final String err;

  const LoginFailure(this.err);
}
