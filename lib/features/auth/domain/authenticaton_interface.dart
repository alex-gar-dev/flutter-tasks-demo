import 'package:tasks_demo_flutter/features/auth/models/auth_user_login_response_status.dart';
import 'package:tasks_demo_flutter/features/auth/models/enum_status.dart';

abstract class AuthenticatonInterface {
  Future<AuthUserLoginResponse> loginByPassword({
    required String emailAddress,
    required String password
  });
  Future<bool> logout();
  Future<RegisterStatus> registerByPassword({
    required String emailAddress,
    required String password
  });
  Future<bool> isLogged();
  String getUserId();
}