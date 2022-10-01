import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:part_app/model/data_model/country.dart';
import 'package:part_app/model/service/api_client.dart';

class CountryService {
  final _apiClient = ApiClient();

  Future<List<Country>> getCountries() async {
    try {
      var response = await _apiClient.get(queryPath: '/countries');
      var data = json.encode(response);
      return countriesFromJson(json.encode(response));
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
