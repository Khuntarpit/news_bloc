import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_bloc/resources/repository.dart';
import 'newsEvent.dart';
import 'newsState.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final Repository repository;

  NewsBloc({required this.repository}) : super(Loading()){
    on<NewsEvent>(_onPostFetched);
  }

  Future<void> _onPostFetched(
      NewsEvent event,
      Emitter<NewsState> emit,
      ) async {
    if (event is Fetch){
      final items = await repository.fetchAllNews(category: event.type);
      return emit(
          Loaded(items: items, type: event.type)
      );
    }
  }

}
