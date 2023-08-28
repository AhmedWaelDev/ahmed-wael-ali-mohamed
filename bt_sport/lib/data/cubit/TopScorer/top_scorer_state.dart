part of 'top_scorer_cubit.dart';

@immutable
abstract class TopScorerState {}

class TopScorerInitial extends TopScorerState {}

class TopScorerReload extends TopScorerState {}

class TopScorerSuccess extends TopScorerState {
  final LeagueTopScorer TopScorerResponse;
  TopScorerSuccess({required this.TopScorerResponse});
}

class TopScorerError extends TopScorerState {}
