import 'package:flutter/material.dart';
import 'package:tasks_demo_flutter/ux/atoms/uxds_button.dart';
import 'package:tasks_demo_flutter/ux/atoms/uxds_form_input.dart';

class LoginForm extends StatefulWidget {

  final String? Function(String?)? validatorEmail;
  final String? Function(String?)? validatorPassword;
  final Function(
    String emailAddress,
    String password
  ) onSubmitFormDone;
  
  const LoginForm({
    required this.validatorEmail,
    required this.validatorPassword,
    required this.onSubmitFormDone,
    super.key
  });

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  void initState() {
    email.text = 'alexgarciamo@gmail.com';
    password.text = 'Tigo2024';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 70,
              bottom: 60
            ),
            child: Text('TaskMaster: Organize, Prioritize, and Achieve!', 
              style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w900
              )
            ),
          ),
          const SizedBox(height: 4),
          UXDSFormField(
            controller: email,
            labelText: 'Email *',
            keyboardType: TextInputType.emailAddress,
            validator: widget.validatorEmail,
          ),
          UXDSFormField(
            controller: password,
            labelText: 'Password *',
            keyboardType: TextInputType.text,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            validator: widget.validatorPassword
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 30),
            child: UXDSButton(
              labelText: 'Sign in',
              onPressed: () {
                if (_form.currentState!.validate()) {
                  widget.onSubmitFormDone(
                    email.value.text,
                    password.value.text
                  );
                }
              }
            ),
          )
        ],
      ),
    );
  }
}
