import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tasks_demo_flutter/features/auth/domain/authenticaton_interface.dart';
import 'package:tasks_demo_flutter/features/auth/models/enum_status.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  
  RegisterCubit(super.initialState);
  
  final authRepository = GetIt.instance<AuthenticatonInterface>();

  Future<void> registerUser({
    required String emailAddress,
    required String password
  }) async {
    emit(LoandingRegister());
    final RegisterStatus response = await authRepository.registerByPassword(
      emailAddress: emailAddress, 
      password: password
    );
    if (response == RegisterStatus.ok) {
      emit(SuccessRegister(credentials: {}));
      return;
    }
    emit(ErrorRegister(registerStatus: response));
  }

}