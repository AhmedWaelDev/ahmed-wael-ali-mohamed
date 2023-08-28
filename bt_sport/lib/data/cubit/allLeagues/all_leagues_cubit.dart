import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/all_Leagues/all_leagues/all_leagues.dart';
import '../../repo/all_LeaguesRepo.dart';

part 'all_leagues_state.dart';

class AllLeaguesCubit extends Cubit<AllLeaguesState> {
  AllLeaguesCubit() : super(AllLeaguesInitial());
  getAllLeagues(int id) {
    emit(AllLeaguesLoading());

    AllNewsRepos().getAllLeagues(id).then((value) {
      if (value != null) {
        emit(AllLeaguesSuccess(leaguesResponse: value));
      } else {
        emit(AllLeaguesErorr());
      }
    });
  }
}
