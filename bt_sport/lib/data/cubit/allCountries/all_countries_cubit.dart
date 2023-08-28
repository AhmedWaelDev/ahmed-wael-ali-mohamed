import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/all_countries/all_countries.dart';
import '../../repo/countriesRepo.dart';

part 'all_countries_state.dart';

class AllCountriesCubit extends Cubit<AllCountriesState> {
  AllCountriesCubit() : super(AllCountriesInitial());

  getAllCountries() {
    emit(AllCountriesLoading());

    AllNewsRepos().getAllCountries().then((value) {
      if (value != null) {
        emit(AllCountriesSuccess(countriesResponse: value));
      } else {
        emit(AllCountriesErorr());
      }
    });
  }
}
