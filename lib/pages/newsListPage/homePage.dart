import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:news_bloc/Elements/CustomText.dart';
import 'package:news_bloc/elements/CustomButton.dart';
import 'package:news_bloc/models/NewsApiResonse/article.dart';
import 'package:news_bloc/theme/bloc/bloc.dart';
import 'package:news_bloc/theme/theme.dart';
import 'package:sizer/sizer.dart';
import 'bloc/bloc.dart';
import 'helperWidget/newsCard.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).backgroundColor,
        statusBarColor: Theme.of(context).backgroundColor));
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is Failure) {
              return Center(child: CustomText(text: 'Something went wrong'));
            }
            if (state is Loaded) {
              if (state.items.isEmpty) {
                return CustomText(text: 'No content avilable');
              } else {
                return _body(context, state.items, type: state.type);
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }


  Widget _headerNews(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _categoryCard(context,'General', 'general',),
          _categoryCard(context,'Tech', 'technology',),
          //  _categoryCard('Fashion','https://thumbs.dreamstime.com/b/abstract-woman-portrait-fashion-background-hand-painted-art-illustration-56110086.jpg'),
          _categoryCard(context,'Economy', 'business',),
          _categoryCard(context,'Sport', 'sports',),
          _categoryCard(context,'Health', 'health',),
          _categoryCard(context,'Fun', 'entertainment',),
          _categoryCard(context,'Science', 'science',),
        ],
      ),
    );
  }

  Widget _categoryCard(BuildContext context ,String text, String type,) {
    return Padding(
      padding: EdgeInsets.all(3.w),
      child: CustomButton(
        title: text.toUpperCase(),
        fontSize: 15.sp,
        shrink: true,
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        onTap: (){
          BlocProvider.of<NewsBloc>(context).add(Fetch(type: type));
        },),
    );
  }

  Widget _body(
      BuildContext context,
      List<Article> list, {
        required String type,
      }) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${type.toUpperCase()} NEWS',
          style: AppTheme.h2Style
              .copyWith(color: Theme.of(context).colorScheme.primaryContainer),
        ),
        backgroundColor: Theme.of(context).bottomAppBarColor,
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                bool isEnable = false;
                if (state is SelectedTheme) {
                  isEnable = state.themeType == ThemeType.Dark ? true : false;
                }
                return  Switch(
                  activeColor: Theme.of(context).primaryColor,
                  inactiveTrackColor: Theme.of(context).disabledColor,
                  onChanged: (value) {
                    BlocProvider.of<ThemeBloc>(context).add(value ? DarkMode() : LightMode());
                  },
                  value: isEnable,
                );
              }),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          _headerNews(context),
          Expanded(
              child: ListView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return NewsCard(
                    artical: list[index],
                    type: type.toUpperCase(),
                  );
                },)
          ),
        ],
      ),
    );
  }

}
