import 'package:tasks_demo_flutter/features/auth/domain/authenticaton_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasks_demo_flutter/features/auth/models/auth_user_login_response_status.dart';
import 'package:tasks_demo_flutter/features/auth/models/enum_status.dart';
import 'package:tasks_demo_flutter/features/auth/models/user_info_model.dart';

class FirebaseAuthentication implements AuthenticatonInterface {

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<AuthUserLoginResponse> loginByPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password
      );
      return AuthUserLoginResponse(
        authUserStatus: AuthUserLoginResponseStatus.ok,
        userInfo: UserInfoModel(
          name: 'Alexis',
          email: emailAddress,
          token: credential.user?.refreshToken ?? ''
        )
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return AuthUserLoginResponse(authUserStatus: AuthUserLoginResponseStatus.usertNotFound);
      } else if (e.code == 'wrong-password') {
        return AuthUserLoginResponse(authUserStatus: AuthUserLoginResponseStatus.wrongPassword);
      }
    }
    return AuthUserLoginResponse(authUserStatus: AuthUserLoginResponseStatus.unknown);
  }
  
  @override
  Future<bool> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<RegisterStatus> registerByPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return RegisterStatus.ok;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return RegisterStatus.weekPassword;
      } else if (e.code == 'email-already-in-use') {
        return RegisterStatus.emailAlreadyInUse;
      }
      return RegisterStatus.unknown;
    } catch (e) {
      return RegisterStatus.unknown;
    }
  }
}