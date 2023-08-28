part of 'players_cubit.dart';

@immutable
abstract class PlayersState {}

class PlayersInitial extends PlayersState {}

class playerLoading extends PlayersState {}

class playerSuccess extends PlayersState {
  final Players playerResponse;
  playerSuccess({required this.playerResponse});
}

class playerError extends PlayersState {}
