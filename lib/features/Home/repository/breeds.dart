import 'package:dio/dio.dart';
import 'package:iti_malia/services/api_service/service.dart';

Future<List<String>> fetchBreeds() async {
  final String endpoint = '/list/all';

  Dio client = await ApiService.getClient();
  Response response = await client.get(endpoint).catchError((e) {});

  Map<String, dynamic> body = response.data['message'];

  return body.keys.toList();
}