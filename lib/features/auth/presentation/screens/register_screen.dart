import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_demo_flutter/core/core.dart';
import 'package:tasks_demo_flutter/features/auth/presentation/cubit/register_cubit.dart';
import 'package:tasks_demo_flutter/ux/ux_design_system.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final _cubit = RegisterCubit(InitRegister());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
        padding: const EdgeInsets.all(40),
        child: SizedBox(
          width: double.infinity,
          child: Form(
            key: _form,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocProvider.value(
                  value: _cubit,
                  child: BlocListener<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is LoandingRegister) {
                        UXDSLoaderScreen.showPageLoandingScreen(context);
                      }
                      if (state is SuccessRegister) {
                        UXDSLoaderScreen.hide(context);
                        UXDSPopupOperationStatus.showAlertDialog(
                          title: 'Your registration was completed successfully.',
                          message: 'Welcome aboard! You can now log in and start using the app.',
                          context: context, 
                          onPressedConfirm: () {
                            context.pop();
                            context.go('/login');
                          }, 
                          alerType: AlerType.success
                        );
                      }
                      if (state is ErrorRegister) {
                        UXDSLoaderScreen.hide(context);
                        UXDSPopupOperationStatus.showAlertDialog(
                          title: 'Unfortunately, your registration could not be completed.',
                          message: 'Please try again later or contact support if the issue persists.',
                          context: context, 
                          onPressedConfirm: () {
                            context.pop();
                          }, 
                          alerType: AlerType.error
                        );
                      }
                    },
                    child: const SizedBox(),
                  )
                ),
                const Text('Create an Account'),
                UXDSFormField(
                  controller: email,
                  labelText: 'Email *',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validators.validate(validators: ['required', 'email'], value: value),
                ),
                UXDSFormField(
                  controller: password,
                  labelText: 'Password *',
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: (value) => Validators.validate(validators: ['required', 'password'], value: value)
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: double.infinity,
                    child: UXDSButton(
                      labelText: 'Register', 
                      onPressed: () {
                        if (_form.currentState!.validate()) {
                          _cubit.registerUser(
                            emailAddress: email.value.text, 
                            password: password.value.text
                          );
                        }
                      }
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
