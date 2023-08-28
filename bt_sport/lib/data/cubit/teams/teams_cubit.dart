import 'package:bloc/bloc.dart';
import 'package:bt_sport/data/repo/teamsRepo.dart';
import 'package:meta/meta.dart';

import '../../models/teams/teams.dart';

part 'teams_state.dart';

class TeamsCubit extends Cubit<TeamsState> {
  TeamsCubit() : super(TeamsInitial());

  getAllTeams(int id, var name) {
    emit(TeamsLoading());

    teamsRepo().getTeams(id, name).then((value) {
      if (value != null) {
        emit(TeamsSuccess(TeamsResponse: value));
      } else {
        emit(TeamsError());
      }
    });
  }

  refresh(id, name) {
    emit(TeamsInitial());
    teamsRepo().getTeams(id, name).then((value) {
      if (value != null) {
        emit(TeamsSuccess(TeamsResponse: value));
      } else {
        emit(TeamsError());
      }
    });
  }
}
