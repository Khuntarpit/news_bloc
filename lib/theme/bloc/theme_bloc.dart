import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_bloc/theme/bloc/theme_event.dart';
import 'package:news_bloc/theme/bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(SelectedTheme(themeType: ThemeType.Light)){
    on<ThemeEvent>(_onThemeChanged);
  }

  Future<void> _onThemeChanged(
      ThemeEvent event,
      Emitter<ThemeState> emit,
      ) async {
    if (event is LightMode){
      return emit(SelectedTheme(themeType: ThemeType.Light));
    } else {
      return emit(SelectedTheme(themeType: ThemeType.Dark));
    }
  }

}
