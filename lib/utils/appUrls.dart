import 'constants.dart';

class AppUrls {
  static const String newsApiKey = 'd0e0ec812de241eab4b73abbeede530f';
  static String baseurl = "https://newsapi.org/v2/";
  static String topHeadLineUrl(String category) => "$baseurl/top-headlines?country=in&apiKey=${AppUrls.newsApiKey}&category=$category";


}