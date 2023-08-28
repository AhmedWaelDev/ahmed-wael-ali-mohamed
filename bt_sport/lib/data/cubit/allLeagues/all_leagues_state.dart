part of 'all_leagues_cubit.dart';

@immutable
abstract class AllLeaguesState {}

class AllLeaguesInitial extends AllLeaguesState {}

class AllLeaguesLoading extends AllLeaguesState {}

class AllLeaguesSuccess extends AllLeaguesState {
  final AllLeagues leaguesResponse;
  AllLeaguesSuccess({required this.leaguesResponse});
}

class AllLeaguesErorr extends AllLeaguesState {}
