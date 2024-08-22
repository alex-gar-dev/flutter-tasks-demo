import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_demo_flutter/core/core.dart';
import 'package:tasks_demo_flutter/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tasks_demo_flutter/ux/ux_design_system.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is LoandingAuthState) {
                        UXDSLoaderScreen.showPageLoandingScreen(context);
                      }
                      else if (state is AuthenticatedAuthState) {
                        UXDSLoaderScreen.hide(context);
                        context.go('/');
                      } else {
                        UXDSLoaderScreen.hide(context);
                        UXDSPopupOperationStatus.showAlertDialog(
                          context: context, 
                          onPressedConfirm: () {
                            context.pop();
                          }, 
                          alerType: AlerType.warning, 
                          title: 'The user was unable to log in.',
                          message: 'Please check the login credentials and try again.',
                          labelButton: 'Ok'
                        );
                      }
                    },
                    child: const SizedBox(),
                  ),
                  LoginForm(
                    validatorEmail: (value) {
                      return Validators.validate(validators: ['required', 'email'], value: value);
                    },
                    validatorPassword: (value) {
                      return Validators.validate(validators: ['required', 'password'], value: value);
                    },
                    onSubmitFormDone: (emailAddress, password) {
                      context.read<AuthCubit>().login(
                        emailAddress: emailAddress, password: password
                      );
                    }
                  ),
                  const UXDSTextDivider(
                    label: 'Or',
                  ),
                  const _LoginProviders()
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}


class _LoginProviders extends StatelessWidget {
  const _LoginProviders();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const UXDSButtonProviders.google(onPressed: null),
          const SizedBox(height: 20),
          const UXDSButtonProviders.apple(onPressed: null),
          const SizedBox(height: 20),
          UXDSButtonLink(
            labelText: 'Create an account here',
            onPressed: () {
              context.push('/register');
            },
          )
        ],
      ),
    );
  }
}
