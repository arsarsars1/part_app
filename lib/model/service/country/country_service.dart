import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:part_app/model/data_model/country.dart';
import 'package:part_app/model/data_model/district.dart';
import 'package:part_app/model/service/api_client.dart';

class CountryService {
  final _apiClient = ApiClient();

  Future<List<Country>> getCountries() async {
    try {
      var response = await _apiClient.get(
        queryPath: '/countries',
      );
      var data = json.encode(response);
      return countriesFromJson(json.encode(response));
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<List<District>> states({required String countryId}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/countries/$countryId/states',
      );
      var data = json.encode(response);
      return districtFromJson(json.encode(response));
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<List<District>> districts({required String stateId}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/state/$stateId/districts',
      );
      var data = json.encode(response);
      return districtFromJson(json.encode(response));
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
