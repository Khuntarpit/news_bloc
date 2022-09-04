import 'package:news_bloc/Utils/Constants.dart';
import 'package:news_bloc/models/NewsApiResonse/article.dart';
import 'package:news_bloc/services/http_service.dart';
import 'package:news_bloc/utils/AppUrls.dart';

class Repository {
  HttpService httpService = HttpService();

  Future<List<Article>> fetchAllNews({String category = ''}) async {
    final response = await httpService.getRequest(AppUrls.topHeadLineUrl(category));
    if (checkResponse(response.statusCode)) {
      List<Article> articles = List<Article>.from(response.data["articles"].map((x) => Article.fromJson(x)));
      return articles;
    } else {
      return [];
    }
  }
}