import 'package:flutter/material.dart';
import 'package:tasks_demo_flutter/app.dart';
import 'package:tasks_demo_flutter/core/core.dart';

void main() {
  ServiceLocatorGetIt.setupLocator();
  runApp(const MainApp());
}


