
import 'package:dio/dio.dart';
import 'package:news_bloc/Utils/appUrls.dart';
import 'package:news_bloc/models/NewsApiResonse/article.dart';
import 'package:news_bloc/services/http_service.dart';
import 'package:news_bloc/utils/constants.dart';

class NewsApiProvider {
  HttpService httpService = HttpService();

  Future<List<Article>> fetchNewsList({String category = ''}) async {
    final response = await httpService.getRequest(AppUrls.topHeadLineUrl(category));
    if (checkResponse(response.statusCode)) {
      List<Article> articles = List<Article>.from(response.data["articles"].map((x) => Article.fromJson(x)));
      return articles;
    } else {
      return [];
    }
  }
}

