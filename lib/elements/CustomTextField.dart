import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_bloc/Elements/CustomStyles.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key, required this.controller,
      this.radius = 10,
      this.keyboardType,
      this.boderWidth = 1,
      this.outPadding = 10,
      this.fontSize = 22,
      this.contentPadding,
      this.maxLength,
      this.counter = false,
      this.hint = '',
      this.obscureText = false,
      this.textAlign,
      this.enabled,
      this.onChange,
      this.validator,
        this.displayError = false,
      this.height,
        this.errorTextStyle,
        this.animation =false
      }) : super(key: key);

  final TextEditingController controller;
  double radius;
  bool animation;
  bool displayError;
  double boderWidth;
  bool? enabled;
  double? height;
  double fontSize;
  double outPadding;
  EdgeInsets? contentPadding;
  int? maxLength;
  bool counter;
  bool obscureText;
  String hint;
  TextInputType? keyboardType;
  TextAlign? textAlign;
  TextStyle? errorTextStyle;
  List<TextInputFormatter>? inputFormatter;
  int? maxLines;
  Function(String)? onChange;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(outPadding),
      child: SizedBox(
        height: height,
        child: TextFormField(
          style: CustomStyles.textStyle(fontSize: fontSize),
          controller: controller,
          expands: false,
          inputFormatters: inputFormatter,
          maxLines: maxLines ?? 1,
          onChanged: onChange,
          enabled: enabled,
          keyboardType: keyboardType,
          autofocus: false,
          textAlign: textAlign ?? TextAlign.start,
          obscureText: obscureText,
          validator: validator,
          maxLength: maxLength,
          decoration: InputDecoration(
              filled: true,
              counterText:  counter ? null : '',
              contentPadding: contentPadding,
              // errorText: '',
              errorStyle:  displayError ? errorTextStyle ?? CustomStyles.textStyle(fontSize: 3.sp) : TextStyle(fontSize: 0),
              hintText: hint),
        ),
      ),
    );
  }
}
