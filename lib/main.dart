import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:news_bloc/pages/newsListPage/bloc/bloc.dart';
import 'package:news_bloc/services/repository.dart';
import 'package:news_bloc/route/Routes.dart';
import 'package:news_bloc/simple_bloc_delegate.dart';
import 'package:news_bloc/theme/bloc/theme_bloc.dart';
import 'package:news_bloc/theme/bloc/theme_state.dart';
import 'package:news_bloc/theme/theme.dart';
import 'package:sizer/sizer.dart';

import 'pages/newsDetailPage/bloc/detail_bloc.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  BlocObserver observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          ThemeData? apptheme;
          return MultiBlocProvider(
            providers: [
              BlocProvider<NewsBloc>(
                create: (context) =>
                NewsBloc(repository: Repository())..add(Fetch(type: 'General')),
              ),
              BlocProvider<DetailBloc>(create: (context) => DetailBloc()),
              BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
            ],
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                if (state is SelectedTheme) {
                  apptheme = state.themeType == ThemeType.Light
                      ? AppTheme.lightTheme
                      : AppTheme.darkTheme;
                }
                return Builder(
                  builder: (context) {
                    return MaterialApp(
                      title: 'News Bloc',
                      theme: apptheme,
                      debugShowCheckedModeBanner: false,
                      routes: Routes.getRoute(),
                    );
                  },
                );
              },
            ),
          );
        }
    );
  }
}


