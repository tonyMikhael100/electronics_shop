import 'package:dio/dio.dart';
import 'dart:developer';

class ApiServices {
  final Dio dio = Dio();
  final String baseUrl = 'http://commercial-upgrador-apps.com/e_commerce_APIs/';

  // Read
  Future<Map<String, dynamic>> getRequest({
    required String endPoint,
    Map<String, dynamic>? params,
  }) async {
    var response = await dio.get('$baseUrl$endPoint', queryParameters: params);
    return response.data;
  }

  // Create (POST)
  Future<Map<String, dynamic>> postRequest({
    required String endPoint,
    required Map<String, dynamic> body,
  }) async {
    var response = await dio.post(
      "$baseUrl$endPoint",
      data: body,
    );
    return response.data;
  }

  // Update (PUT)
  Future<Map<String, dynamic>> putRequest({
    required String endPoint,
    required Map<String, dynamic> body,
  }) async {
    var response = await dio.put('$baseUrl$endPoint', data: body);
    return response.data;
  }

  // Delete (DELETE)
  Future<Map<String, dynamic>> deleteRequest({
    required String endPoint,
    Map<String, dynamic>? params,
  }) async {
    var response =
        await dio.delete('$baseUrl$endPoint', queryParameters: params);
    return response.data;
  }
}
