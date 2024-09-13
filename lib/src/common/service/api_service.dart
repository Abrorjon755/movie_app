import 'dart:convert';

import 'package:dio/dio.dart';

enum Method {
  get,
  put,
  post,
  delete,
}

class ApiService {
  const ApiService({required this.dio});

  final Dio dio;

  Future<String?> request(
    String path, {
    Method method = Method.get,
    bool setToken = true,
    Object? data,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
    FormData? formData,
  }) async {
    final requestHeaders = {
      ...?headers,
      "content-type": data != null ? "multipart/form-data" : "application/json",
    };
    final response = await dio.request(
      path,
      data: data ?? formData,
      queryParameters: queryParams,
      options: Options(
        method: method.name,
        headers: requestHeaders,
      ),
    );
    if (response.statusCode == null ||
        response.statusCode! > 204 ||
        response.data == null) {
      throw Exception("API error");
    }
    return jsonEncode(response.data);
  }
}
