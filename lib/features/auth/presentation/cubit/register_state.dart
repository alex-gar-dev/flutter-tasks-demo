part of 'register_cubit.dart';

abstract class RegisterState {  }

class InitRegister implements RegisterState {}

class LoandingRegister implements RegisterState {}

class SuccessRegister implements RegisterState {
  final Map credentials;
  SuccessRegister({
    required this.credentials
  });
}

class ErrorRegister implements RegisterState {
  final RegisterStatus registerStatus;

  ErrorRegister({
    required this.registerStatus
  });
  
}