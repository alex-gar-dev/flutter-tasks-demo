import 'package:tasks_demo_flutter/features/auth/models/user_info_model.dart';

enum AuthUserLoginResponseStatus { ok, usertNotFound, wrongPassword, unknown }

class AuthUserLoginResponse {
  final AuthUserLoginResponseStatus authUserStatus;
  final UserInfoModel? userInfo;

  AuthUserLoginResponse({
    required this.authUserStatus,
    this.userInfo
  });
}