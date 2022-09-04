import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_bloc/Elements/CustomStyles.dart';

class CustomText extends StatelessWidget {
  CustomText({required this.text, this.color,this.fontWeight,this.fontSize});

  String text;
  Color? color;
  FontWeight? fontWeight;
  double? fontSize;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CustomStyles.textStyle(
        fontSize: fontSize,
        fontColor: color,
        fontWeight: fontWeight
      ),
    );
  }
}
