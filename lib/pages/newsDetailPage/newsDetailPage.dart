import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_bloc/Elements/CustomText.dart';
import 'package:news_bloc/models/NewsApiResonse/article.dart';
import 'package:news_bloc/pages/newsListPage/bloc/bloc.dart';
import 'package:news_bloc/theme/color/lightColor.dart';
import 'package:news_bloc/utils/extenstions.dart';
import 'package:sizer/sizer.dart';
import 'bloc/bloc.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({Key? key}) : super(key: key);

  Widget _headerNews(BuildContext context, Article article) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Hero(
          tag: 'headerImage',
          child: article.urlToImage.isEmpty
              ? Container()
              : Image.network(article.urlToImage,fit: BoxFit.cover,),
        ),
        Container(
          padding: EdgeInsets.only(left: 0, right: 3.w, bottom: 6.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: article.urlToImage.isNotEmpty ? LightColor.background : Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              const Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  color: article.urlToImage.isNotEmpty ? LightColor.background : Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: article.urlToImage.isNotEmpty ? LightColor.background : Theme.of(context).textTheme.bodyText1!.color,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
  Widget _body(BuildContext context, Article article) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: _headerNews(context, article),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 1.h),
              CustomText(text: article.title,fontSize: 20.sp,fontWeight: FontWeight.bold),
              SizedBox(height: 1.h,),
              Row(
                children: <Widget>[
                  CustomText(text: article.author),
                  SizedBox(width: 3.w,),
                  CustomText(text: article.publishedAt == null ? "" : article.publishedAt!.dayFormat.toString(),),
                ],
              ),
              Divider(height: 3.h, thickness: 1,),
              CustomText(text: article.content,fontSize: 18.sp,)
            ],
          ),
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state is Failure) {
              return Center(child: CustomText(text: 'Something went wrong'));
            }
            if (state is LoadedArticle) {
              return _body(
                context,
                state.selectedArticle,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        )));
  }
}
