import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/Data/Model/all_news/all_news.dart';

class AllNewsRepos {
  Future<AllNews?> getAllNews() async {
    try {
      var response = await http.get(Uri.parse(
          'https://newsapi.org/v2/everything?q=tesla&from=2023-06-26&sortBy=publishedAt&apiKey=aa79e99a032d4bf095f9210f7d5655ff'));
      Map<String, dynamic> deCodeResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        AllNews data = AllNews.fromJson(deCodeResponse);
        print(data.articles![0].author);
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
