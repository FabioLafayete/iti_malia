import 'package:dio/dio.dart';
import 'package:iti_malia/services/api_service/service.dart';

Future<List<dynamic>> fetchImagesBreeds(String breed) async {
  final String endpoint = '/breed/$breed/images';

  Dio client = await ApiService.getClient();
  Response response = await client.get(endpoint).catchError((e) {});

  List<dynamic> body = response.data['message'];

  return body;
}