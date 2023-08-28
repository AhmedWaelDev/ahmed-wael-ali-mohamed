import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/league_top_scorer/league_top_scorer.dart';
import '../../repo/leagueTopScorerRepo.dart';

part 'top_scorer_state.dart';

class TopScorerCubit extends Cubit<TopScorerState> {
  TopScorerCubit() : super(TopScorerInitial());

  getTopScorer(int id) {
    emit(TopScorerReload());

    TopScorerRepos().getLeagueTopScorer(id).then((value) {
      if (value != null) {
        emit(TopScorerSuccess(TopScorerResponse: value));
      } else {
        emit(TopScorerError());
      }
    });
  }
}
