import 'package:flutter/material.dart';
import 'package:news_bloc/pages/newsListPage/homePage.dart';
import 'package:news_bloc/pages/newsDetailPage/newsDetailPage.dart';

abstract class Routes{

  static const newsListPage = '/';
  static const newsDetailPage = '/newsDetailPage';


  static Map<String,WidgetBuilder> getRoute(){
    return  <String, WidgetBuilder>{
      newsListPage: (_) => NewsListPage(),
      newsDetailPage: (_) => NewsDetailPage(),
    };
  }

}