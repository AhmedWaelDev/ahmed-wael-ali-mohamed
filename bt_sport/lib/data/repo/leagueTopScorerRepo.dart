import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/league_top_scorer/league_top_scorer.dart';

class TopScorerRepos {
  Future<LeagueTopScorer?> getLeagueTopScorer(int id) async {
    try {
      var response = await http.get(Uri.parse(
          'https://apiv2.allsportsapi.com/football/?&met=Topscorers&leagueId=${id}&APIkey=Topscorers&APIkey=1ec45d8da4e34161d508a5360d5d7ea6172a2e546c61a34632cabe65ccee5378'));
      Map<String, dynamic> deCodeResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        LeagueTopScorer data = LeagueTopScorer.fromJson(deCodeResponse);
        return data;
      } else {
        print('failed');
        print('statusCode : ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error : ${error}');
    }
    return null;
  }
}
