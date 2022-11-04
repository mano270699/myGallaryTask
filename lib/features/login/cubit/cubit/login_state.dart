part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class Loginloading extends LoginState {}

class LoginSuccessfully extends LoginState {}

class LoginFailed extends LoginState {}
