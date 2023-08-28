import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/all_Leagues/all_leagues/all_leagues.dart';

class AllNewsRepos {
  Future<AllLeagues?> getAllLeagues(int id) async {
    try {
      var response = await http.get(Uri.parse(
          'https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=1ec45d8da4e34161d508a5360d5d7ea6172a2e546c61a34632cabe65ccee5378&countryId=${id}'));
      Map<String, dynamic> deCodeResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        AllLeagues data = AllLeagues.fromJson(deCodeResponse);
        print(data.result![0].leagueName!);
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
