import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:part_app/model/data_base/data_base.dart';

class ApiClient {
  final _baseUrl = 'https://dev.partapp.in/api';
  final _token = 'h5uA9WokuxSNDJGYK0UevodqEWJjYzlB';
  final _dio = Dio();

  Future get({required String queryPath}) async {
    var path = _baseUrl + queryPath;

    String? bearerToken = Database().getToken();
    if (kDebugMode) {
      print(bearerToken);
    }

    var response = await _dio.get(
      path,
      options: Options(
        headers: {
          'MOBILE-APP-TOKEN': _token,
          'Authorization': 'Bearer $bearerToken',
        },
      ),
    );
    return _handleResponse(
      response,
    );
  }

  /// POST REQUEST
  /// method to post he data to the server
  /// required [ postPath ] query path of the API
  /// required [ data ] post data
  /// optional [ formData ]

  Future post({
    required String postPath,
    required Map<String, dynamic> data,
    bool formData = false,
    String? basePath,
    Map<String, dynamic>? header,
  }) async {
    // build the base path for the post request
    String path = _baseUrl + postPath;
    if (kDebugMode) {
      print('POST METHOD | URL -> $path\n');
      print('********** POST DATA ***********');

      log(json.encode(data));

      print('********** API CALL ***********');
    }
    String? bearerToken = Database().getToken();
    if (kDebugMode) {
      print(bearerToken);
    }
    // posts the data to service with headers
    var response = await _dio.post(
      basePath ?? path,
      data: formData ? FormData.fromMap(data) : data,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status != null && status < 500;
        },
        headers: header ??
            {
              'MOBILE-APP-TOKEN': _token,
              'Authorization': 'Bearer $bearerToken',
              "Accept": "application/json",
            },
      ),
    );
    if (kDebugMode) {
      print('********** API END ***********');
      print(
        'STATUS -> Code : ${response.statusCode}, Status : ${response.statusMessage}',
      );
      log(json.encode(response.data));
      print('**********         ***********');
    }
    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    return response.data;
  }
}
