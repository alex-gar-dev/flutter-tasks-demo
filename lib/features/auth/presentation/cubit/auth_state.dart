
part of 'auth_cubit.dart';

abstract class AuthState {}

class LoandingAuthState implements AuthState {}

class AuthenticatedAuthState implements AuthState {
  final UserInfoModel userInfoModel;
  AuthenticatedAuthState({
    required this.userInfoModel
  });
}

class WrongPasswordAuthState implements AuthState {}

class UsertNotFoundAuthState implements AuthState {}

class UnknownAuthState implements AuthState {}

class UnauthenticatedAuthState implements AuthState {}
