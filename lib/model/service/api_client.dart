import 'package:dio/dio.dart';

class ApiClient {
  final _baseUrl = 'https://dev.partapp.in/api';
  final _dio = Dio();

  Future get({required String queryPath}) async {
    var path = _baseUrl + queryPath;

    var response = await _dio.get(
      path,
      options: Options(
        headers: {
          'MOBILE-APP-TOKEN': 'h5uA9WokuxSNDJGYK0UevodqEWJjYzlB',
        },
      ),
    );
    return _handleResponse(
      response,
    );
  }

  dynamic _handleResponse(Response response) {
    return response.data;
  }
}
