part of 'country_cubit.dart';

@immutable
abstract class CountryState {}

class CountryInitial extends CountryState {}

class CountriesLoaded extends CountryState {}

class StateLoading extends CountryState {}

class StateLoaded extends CountryState {}

class DistrictLoaded extends CountryState {}

class DistrictLoading extends CountryState {}

class CountriesLoading extends CountryState {}
