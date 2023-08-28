import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/teams/teams.dart';

class teamsRepo {
  Future<Teams?> getTeams(int id, name) async {
    try {
      var response = await http.get(Uri.parse(
          'https://apiv2.allsportsapi.com/football/?&met=Teams&APIkey=1ec45d8da4e34161d508a5360d5d7ea6172a2e546c61a34632cabe65ccee5378&teamId=&leagueId=${id}&teamName=${name}'));
      Map<String, dynamic> deCodeResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        Teams data = Teams.fromJson(deCodeResponse);
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
