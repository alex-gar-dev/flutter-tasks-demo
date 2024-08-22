import 'package:flutter/material.dart';

enum AlerType { success, error, warning }

class UXDSPopupOperationStatus {

  static Widget _getIconByAlert({
    required AlerType alerType
  }) {
    switch (alerType) {
      case AlerType.success:
        return const Icon(Icons.done_outline_rounded, color: Colors.green);
      case AlerType.error:
        return const Icon(Icons.cancel_presentation, color: Colors.red);
      case AlerType.warning:
      default:
        return const Icon(Icons.info_outline_rounded, color: Colors.grey);
    }
  }

  static showAlertDialog({
    required BuildContext context,
    required void Function()? onPressedConfirm,
    required AlerType alerType,
    required String title,
    required String message,
    String labelButton = 'Confirm',
  }) {
   
    Widget okButton = TextButton(
      onPressed: onPressedConfirm,
      child: Text(labelButton)
    );

    
    AlertDialog alert = AlertDialog(
      icon: _getIconByAlert(alerType: alerType),
      title: Text(title, textAlign: TextAlign.center),
      content: Text(message, textAlign: TextAlign.center),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        okButton
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