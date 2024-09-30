import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../utils/exceptions.dart';

enum Method {
  get,
  put,
  post,
  delete,
}

class ApiService {
  const ApiService({required this.dio});

  final Dio dio;

  Future<bool> checkConnection() async {
    final connectivity = await (Connectivity().checkConnectivity());
    if (connectivity.contains(ConnectivityResult.mobile) ||
        connectivity.contains(ConnectivityResult.wifi)) return true;
    return false;
  }

  Future<String?> request(
    String path, {
    Method method = Method.get,
    bool setToken = true,
    Object? data,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
    FormData? formData,
  }) async {
    final sw = Stopwatch()..start();
    if (!await checkConnection()) throw const NotNetworkConnected();

    try {
      final requestHeaders = {
        ...?headers,
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMGI2NTI1ODk2Zjg5MjEzZjQyZTlhYTI3OWQwNTcwZSIsIm5iZiI6MTcyNjIxOTAyOS40NTM2NjEsInN1YiI6IjY2ZTQwMjVmYzgxYjI0YjNmZTIzZmFhOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iBul-VZthLXTUvZIgqpsmA3But9KozuUcPf5KI2nZig',
        'accept': 'application/json',
        'content-Type':
            formData != null ? 'multipart/form-data' : 'application/json',
      };

      final requestQueryParams = {
        ...?queryParams,
        'language': 'en-US',
      };

      final response = await dio.request<Object?>(path,
          data: data ?? formData,
          queryParameters: requestQueryParams,
          options: Options(
            method: method.name,
            headers: requestHeaders,
          ));

      if (response.statusCode == null ||
          response.statusCode! > 204 ||
          response.data == null) {
        throw Exception('API Error');
      }

      return jsonEncode(response.data);
    } on Object catch (_) {
      rethrow;
    } finally {
      debugPrint('TIME FOR API -> ${(sw..stop()).elapsedMilliseconds} ms');
    }
  }
}
