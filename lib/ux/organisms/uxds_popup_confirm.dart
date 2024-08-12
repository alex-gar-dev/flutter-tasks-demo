import 'package:flutter/material.dart';

class UXDSPopupConfirm {
  static showAlertDialog({
    required BuildContext context,
    required void Function()? onPressedConfirm,
    required void Function()? onPressedCancel
  }) {
   
    Widget okButton = TextButton(
      onPressed: onPressedConfirm,
      child: const Text('Confirm'),
    );

    Widget cancelButton = TextButton(
      onPressed: onPressedCancel,
      child: const Text('Cancel')
    );
    
    AlertDialog alert = AlertDialog(
      title: const Text('Delete Task'),
      content: const Text('Are you sure you want to delete this task? This action cannot be undone.'),
      actions: [
        okButton,
        cancelButton
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}