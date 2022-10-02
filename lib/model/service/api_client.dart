import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  final _baseUrl = 'https://dev.partapp.in/api';
  final _token = 'h5uA9WokuxSNDJGYK0UevodqEWJjYzlB';
  final _dio = Dio();

  Future get({required String queryPath}) async {
    var path = _baseUrl + queryPath;

    var response = await _dio.get(
      path,
      options: Options(
        headers: {
          'MOBILE-APP-TOKEN': _token,
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
  }) async {
    // build the base path for the post request
    String path = _baseUrl + postPath;
    if (kDebugMode) {
      print('POST METHOD | URL -> $path\n');
      print('********** POST DATA ***********');
      print(data);
      print('********** API CALL ***********');
    }

    // posts the data to service with headers
    var response = await _dio.post(
      path,
      data: formData ? FormData.fromMap(data) : data,
      options: Options(
        headers: {
          'MOBILE-APP-TOKEN': _token,
        },
      ),
    );
    if (kDebugMode) {
      print('********** API END ***********');
      print(response.data);
      print(
        'STATUS -> Code : ${response.statusCode}, Status : ${response.statusMessage}',
      );
      print('**********         ***********');
    }
  }

  dynamic _handleResponse(Response response) {
    return response.data;
  }
}
