import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tasks_demo_flutter/features/auth/domain/authenticaton_interface.dart';
import 'package:tasks_demo_flutter/features/auth/models/auth_user_login_response_status.dart';
import 'package:tasks_demo_flutter/features/auth/models/user_info_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  AuthCubit(super.initialState);
  
  final authRepository = GetIt.instance<AuthenticatonInterface>();

  Future<void> login({
    required String emailAddress,
    required String password
  }) async {
    emit(LoandingAuthState());
    final AuthUserLoginResponse response = await authRepository.loginByPassword(
      emailAddress: emailAddress, password: password
    );
    switch (response.authUserStatus) {
      case AuthUserLoginResponseStatus.ok:
        emit(AuthenticatedAuthState(
          userInfoModel: response.userInfo!
        ));
        return;
      case AuthUserLoginResponseStatus.usertNotFound:
        emit(UsertNotFoundAuthState());
        return;
      case AuthUserLoginResponseStatus.wrongPassword:
        emit(WrongPasswordAuthState());
        return;
      default:
        emit(UnknownAuthState());
    }
  }

  Future<bool> logout() async {
    bool response = await authRepository.logout();
    if (response) {
      emit(UnauthenticatedAuthState());
    }
    return response;
  }

  String getUserName() {
    final s = state;
    if (s is AuthenticatedAuthState) {
      return s.userInfoModel.name;
    }
    return '';
  }

}