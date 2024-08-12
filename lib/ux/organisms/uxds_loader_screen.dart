import 'package:flutter/material.dart';

class UXDSLoaderScreen {
  
  static showPageLoandingScreen(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Evita cerrar el modal haciendo clic fuera de él
      builder: (BuildContext context) {
        return const PopScope(
          canPop: false, // Evita que el botón de retroceso cierre el modal
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }


}