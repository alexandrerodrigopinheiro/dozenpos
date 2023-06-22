import 'package:flutter/material.dart';


class GlobalColor {
  static const primaryColor = Color(0XFFfc9360);
  static const secondaryColor = Color(0XFF4f4f4f);
  static const colorDanger = Color(0XFFf44336);
  static const colorWarning = Color(0XFFff9800);
  static const colorSuccess = Color(0XFF4cac01);
  static const colorPrimary = Color(0XFF2196f3);
  static const colorInfo = Color(0XFF00Bcd4);
  static const colorDefault = Color(0XFFd8dada);
  static const defaultPadding = 10.0;
}


ThemeData appThemeData(BuildContext context) => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Lato Regular',
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
