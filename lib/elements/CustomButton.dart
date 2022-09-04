import 'package:flutter/material.dart';
import 'package:news_bloc/Elements/CustomStyles.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  double? fontSize;
  EdgeInsets? padding;
  double? radius;
  Function onTap;
  double elevation;
  String title;
  double borderWidth;
  Size? size;
  bool shrink;


  CustomButton(
      {required this.title,
      this.radius,
        this.borderWidth = 0,
      this.padding,
      this.fontSize = 16,
      required this.onTap,
      this.elevation = 0,
      this.size,
        this.shrink = false,
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),

      child:  Text(title,style: CustomStyles.textStyle(fontSize:  fontSize),),
      clipBehavior: Clip.antiAlias,
      style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: MaterialStateProperty.all(elevation),
          padding: MaterialStateProperty.all(    padding ?? const EdgeInsets.symmetric(horizontal: 10,vertical: 5)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? 30))),
          animationDuration: const Duration(milliseconds: 500),
          splashFactory: InkSplash.splashFactory,
           maximumSize: shrink ? null : MaterialStateProperty.all(size ?? (Size(60.w, 6.h))),
           minimumSize: shrink ? null : MaterialStateProperty.all(size ?? (Size(60.w, 6.h))),
          visualDensity: VisualDensity.standard,
          // padding: MaterialStateProperty.all(EdgeInsets.all(20)),
          // surfaceTintColor:  MaterialStateProperty.all(Colors.greenAccent)
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  double? fontSize;
  EdgeInsets? padding;
  double? radius;
  Function onTap;
  double elevation;
  Widget icon;
  double borderWidth;
  Size? size;
  bool shrink;


  CustomIconButton(
      {required this.icon,
        this.radius,
        this.borderWidth = 0,
        this.padding,
        this.fontSize,
        required this.onTap,
        this.elevation = 0,
        this.size,
        this.shrink = true,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      clipBehavior: Clip.antiAlias,
      style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: MaterialStateProperty.all(elevation),
          padding: MaterialStateProperty.all(    padding ?? const EdgeInsets.symmetric(horizontal: 10,vertical: 5)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? 30))),
          animationDuration: const Duration(milliseconds: 500),
          splashFactory: InkSplash.splashFactory,
          maximumSize: shrink ? null : MaterialStateProperty.all(size ?? ( Size(60.w, 6.h))),
          minimumSize: shrink ? null : MaterialStateProperty.all(size ?? ( Size(60.w, 6.h))),
          visualDensity: VisualDensity.standard,
          // padding: MaterialStateProperty.all(EdgeInsets.all(20)),
          // surfaceTintColor:  MaterialStateProperty.all(Colors.greenAccent)
      ),
      child:  icon,
    );
  }
}
