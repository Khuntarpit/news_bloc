import 'package:equatable/equatable.dart';
import 'package:news_bloc/models/article/article.dart';


abstract class NewsDetailEvent extends Equatable{
  const NewsDetailEvent();

  @override
  List<Object> get props => [];
}

class SelectNewsForDetail extends NewsDetailEvent {
  final Article article;
  const SelectNewsForDetail({required this.article});

  @override
  String toString() => 'SelectNewsForDetail Page { Title:: ${article.title} }';
}
