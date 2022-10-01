import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/country.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/service/country/country_service.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final _countryService = CountryService();

  CountryCubit() : super(CountryInitial());

  List<Country> _countries = [];

  List<Country> get counties => _countries;

  List<DropDownItem> get countriesForDropDown => _countries
      .map((e) => DropDownItem(id: e.id, title: e.name, item: e))
      .toList();

  DropDownItem? get defaultCountry => _countries.isEmpty
      ? null
      : buildMenuItem(_countries.firstWhere((country) => country.id == 356));

  /// GET COUNTRIES
  /// Method to get the list of countries from the service
  /// creates a list of [Country] objects

  Future getCountries() async {
    // if the state is still loading no need to call the api again
    if (state is CountriesLoading) return;

    emit(CountriesLoading());

    // fetch the data from service
    List<Country> countriesList = await _countryService.getCountries();

    // add it to local state for future reference
    _countries = countriesList;

    // notifies the UI
    emit(CountriesLoaded());
  }

  DropDownItem buildMenuItem(Country country) {
    return DropDownItem(id: country.id, title: country.name, item: country);
  }
}
