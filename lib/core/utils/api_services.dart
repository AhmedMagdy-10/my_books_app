import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio = Dio();

  final String baseUrl = "https://www.googleapis.com/books/v1/volumes?";

  Future<Map<String, dynamic>> getData({required String endpoint}) async {
    var response = await dio.get('$baseUrl$endpoint');
    return response.data;
  }
}
