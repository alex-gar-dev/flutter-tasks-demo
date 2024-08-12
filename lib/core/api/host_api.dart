import 'package:dio/dio.dart';
import 'package:tasks_demo_flutter/core/enviroment_variables/enviroment_variables.dart';

class HostApi {
  final _service = Dio(); // With default `Options`.
  get service => _service;

  HostApi() {
    _configureDio();
  }
  
  Future<void> _configureDio() async {
    // Set default configs
    _service.options.baseUrl = EnviromentVariables.host;
    _service.options.connectTimeout = const Duration(seconds: 5);
    _service.options.receiveTimeout = const Duration(seconds: 3);
    _service.options.headers = {
      'Authorization': 'Bearer ${EnviromentVariables.token}'
    };
    _service.options.queryParameters = {
      'token': 'user_demo_test'
    };
  }

}