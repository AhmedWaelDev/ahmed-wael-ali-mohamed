import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/Players/Players.dart';
import '../../repo/playersRepo.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit() : super(PlayersInitial());

  getAllPlayers(int id, var name) {
    emit(playerLoading());
    PlayersRepo().getPlayers(id, name).then((value) {
      if (value != null) {
        emit(playerSuccess(playerResponse: value));
      } else {
        emit(playerError());
      }
    });
  }

  refresh(id, name) {
    emit(PlayersInitial());
    PlayersRepo().getPlayers(id, name).then((value) {
      if (value != null) {
        emit(playerSuccess(playerResponse: value));
      } else {
        emit(playerError());
      }
    });
  }
}
