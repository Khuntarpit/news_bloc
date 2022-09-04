import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail_event.dart';
import 'detail_state.dart';

class DetailBloc extends Bloc<NewsDetailEvent, DetailState> {
  DetailBloc() : super(LoadingDetail()) {
    on<NewsDetailEvent>(_onNewsDetailFetched);
  }

  Future<void> _onNewsDetailFetched(
      NewsDetailEvent event,
      Emitter<DetailState> emit,
      ) async {
    if (event is SelectNewsForDetail){
      return emit(
          LoadedArticle(selectedArticle: event.article)
      );
    }
  }

}
