part of 'all_countries_cubit.dart';

@immutable
abstract class AllCountriesState {}

class AllCountriesInitial extends AllCountriesState {}

class AllCountriesLoading extends AllCountriesState {}

class AllCountriesSuccess extends AllCountriesState {
  final AllCountries countriesResponse;

  AllCountriesSuccess({required this.countriesResponse});
}

class AllCountriesErorr extends AllCountriesState {}
