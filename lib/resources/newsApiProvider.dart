
import 'package:dio/dio.dart';
import 'package:news_bloc/Utils/AppUrls.dart';
import 'package:news_bloc/Utils/Constants.dart';
import 'package:news_bloc/models/NewsApiResonse/article.dart';

class NewsApiProvider {
  Dio client = Dio();

  Future<List<Article>> fetchNewsList({String category = ''}) async {
    var url = "${AppUrls.topHeadLineUrl}?country=in&apiKey=${AppUrls.newsApiKey}&category=$category";
    printLog("topHeadLine Url : $url");
    final response = await client.get(url);
    printLog(response.data.toString());
    if (response.statusCode == 200) {
      List<Article> articles = List<Article>.from(response.data["articles"].map((x) => Article.fromJson(x)));
      return articles;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
