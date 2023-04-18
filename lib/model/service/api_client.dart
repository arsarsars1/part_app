import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_base/data_base.dart';

class ApiClient {
  static final ApiClient _client = ApiClient._internal();

  factory ApiClient() {
    return _client;
  }

  ApiClient._internal() {
    controller ??= StreamController<int>();
  }

  /// listener for api status
  StreamController<int>? controller;

  final _baseUrl = F.baseUrl;
  final _token = 'h5uA9WokuxSNDJGYK0UevodqEWJjYzlB';
  final _dio = Dio();

  String get token => _token;

  Future get({required String queryPath, String? baseUrl}) async {
    var path = _baseUrl + queryPath;

    String? bearerToken = Database().getToken();
    if (kDebugMode) {
      print('GET Path => $path');
      print(bearerToken);
    }

    // check for internet connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      controller?.add(600);
      return null;
    }
    try {
      var response = await _dio.get(
        baseUrl ?? path,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status != null && status < 500;
          },
          headers: {
            'MOBILE-APP-TOKEN': _token,
            'Authorization': 'Bearer $bearerToken',
            'Accept': 'application/json',
          },
        ),
      );

      log(json.encode(response.data));
      return _handleResponse(
        response,
      );
    } catch (e) {
      return e;
    }
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

      if (!formData) {
        log(json.encode(data));
      }

      print('********** API CALL ***********');
    }
    String? bearerToken = Database().getToken();
    if (kDebugMode) {
      print(bearerToken);
      print('POST Path => $path');
    }

    // check for internet connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      controller?.add(600);
      return null;
    }

    // posts the data to service with headers
    try {
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
    } catch (e) {
      print(e);
    }
  }

  Future delete({required String queryPath, String? baseUrl}) async {
    var path = _baseUrl + queryPath;

    String? bearerToken = Database().getToken();
    if (kDebugMode) {
      print('GET Path => $path');
      print(bearerToken);
    }

    // check for internet connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      controller?.add(600);
      return null;
    }
    try {
      var response = await _dio.delete(
        baseUrl ?? path,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status != null && status < 500;
          },
          headers: {
            'MOBILE-APP-TOKEN': _token,
            'Authorization': 'Bearer $bearerToken',
            'Accept': 'application/json',
          },
        ),
      );

      log(json.encode(response.data));
      return _handleResponse(
        response,
      );
    } catch (e) {
      return e;
    }
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode == 401) {
      controller?.add(401);
    }
    return response.data;
  }
}
