import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_bloc/Elements/CustomText.dart';
import 'package:news_bloc/models/NewsApiResonse/article.dart';
import 'package:news_bloc/pages/newsDetailPage/bloc/bloc.dart';
import 'package:news_bloc/route/Routes.dart';
import 'package:news_bloc/theme/color/lightColor.dart';
import 'package:news_bloc/utils/extenstions.dart';
import 'package:sizer/sizer.dart';

class NewsCard extends StatelessWidget {
  final Article artical;
  final String type;
  const NewsCard(
      {Key? key, required this.artical, this.type = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<DetailBloc>(context).add(SelectNewsForDetail(article: artical));
        Navigator.pushNamed(context, Routes.newsDetailPage);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        margin: EdgeInsets.symmetric(vertical: 2.w),
        height: 16.h,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                    color: Theme.of(context).primaryColor,
                    child: artical.urlToImage.isEmpty
                        ? Container()
                        : Image.network(artical.urlToImage,fit: BoxFit.cover,)),
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SizedBox(),
                Text(
                  artical.title,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.fade,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: CustomText(
                        text:type,
                        fontSize: 12.sp,
                        color: LightColor.background,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 2.w),
                      child: CustomText(
                        text: artical.publishedAt == null ? "" : artical.publishedAt!.dayFormat.toString(),
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
