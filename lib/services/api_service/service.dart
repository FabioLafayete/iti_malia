import 'package:dio/dio.dart';
import 'package:iti_malia/.env.dart';
import 'interceptors.dart';

class ApiService {
  static getClient() async {
    Dio client = Dio();

    client.lock();
    client.options.baseUrl = environment['baseUrl'];
    client.interceptors.add(CustomInterceptors());
    client.options.connectTimeout = 5000;
    client.unlock();

    return client;
  }
}
