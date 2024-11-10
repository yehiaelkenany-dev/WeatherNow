import 'package:flutter/material.dart';
import 'package:weather_now/presentation/color_manager.dart';
import 'package:weather_now/presentation/font_manager.dart';
import 'package:weather_now/presentation/styles_manager.dart';
import 'package:weather_now/presentation/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.primary,
    // cardview theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularTextStyle(
          color: ColorManager.white, fontSize: FontSize.s16),
    ),
    // button theme
  );
}
