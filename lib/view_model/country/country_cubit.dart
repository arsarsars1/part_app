import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/academy_type.dart';
import 'package:part_app/model/data_model/country.dart';
import 'package:part_app/model/data_model/district.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/service/country/country_service.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final _countryService = CountryService();

  CountryCubit() : super(CountryInitial());

  List<Country> _countries = [];
  List<District> _districts = [];
  List<District> _states = [];
  List<AcademyType> _academyTypes = [];

  DropDownItem? _district;
  DropDownItem? _state;

  List<Country> get counties => _countries;

  List<District> get states => _states;

  List<District> get districts => _districts;

  List<DropDownItem> get academyTypes => _academyTypes
      .map((e) => DropDownItem(id: e.id, title: e.academyType, item: e))
      .toList();

  List<DropDownItem> get countriesForDropDown => _countries
      .map((e) => DropDownItem(id: e.id, title: e.name, item: e))
      .toList();

  List<DropDownItem> get statesForDropDown => _states
      .map((e) => DropDownItem(id: e.id, title: e.stateName, item: e))
      .toList();

  List<DropDownItem> get districtsForDropDown => _districts
      .map((e) => DropDownItem(id: e.id, title: e.districtName, item: e))
      .toList();

  DropDownItem? get defaultCountry => _countries.isEmpty
      ? null
      : buildMenuItem(
          _countries.firstWhere((country) => country.callingCode == '91'));

  DropDownItem? get defaultState => _state;

  DropDownItem? get defaultDistrict => _district;

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

    await getStates(
      countryId: defaultCountry?.id as int,
    );

    await getDistricts(
      stateId: _states.first.id,
    );
    await getAcademyTypes();

    // notifies the UI
    emit(CountriesLoaded());
  }

  Future getStates({required int countryId}) async {
    List<District> states = await _countryService.states(
      countryId: countryId,
    );

    _states = states;

    // creates a default menu item for state
    District tempState = _states.first;
    _state = DropDownItem(
      id: tempState.id,
      title: tempState.stateName,
      item: tempState,
    );
    // notifies the UI
    emit(StateLoaded());
  }

  Future getDistricts({required int stateId}) async {
    List<District> districts = await _countryService.districts(
      stateId: stateId,
    );
    _districts = districts;

    // creates a default menu item for state
    District tempDistrict = _districts.first;
    _district = DropDownItem(
      id: tempDistrict.id,
      title: tempDistrict.districtName,
      item: tempDistrict,
    );
    // notifies the UI
    emit(DistrictLoaded());
  }

  Future getAcademyTypes() async {
    List<AcademyType> types = await _countryService.academyTypes();
    _academyTypes = types;
  }

  DropDownItem buildMenuItem(Country country) {
    return DropDownItem(id: country.id, title: country.name, item: country);
  }

  DropDownItem getState(int? stateId) {
    var item = _states.firstWhere((element) => element.id == stateId);
    return DropDownItem(
      id: item.id,
      title: item.stateName,
      item: item,
    );
  }

  DropDownItem getCountry(int? countryId) {
    var item = _countries.firstWhere((element) => element.id == countryId);
    return DropDownItem(
      id: item.id,
      title: item.name,
      item: item,
    );
  }

  DropDownItem getDistrict(int? districtId) {
    var item = _districts.firstWhere((element) => element.id == districtId);
    return DropDownItem(
      id: item.id,
      title: item.districtName,
      item: item,
    );
  }
}
