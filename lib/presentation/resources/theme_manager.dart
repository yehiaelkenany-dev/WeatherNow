import 'package:flutter/material.dart';
import 'package:weather_now/presentation/resources/color_manager.dart';
import 'package:weather_now/presentation/resources/font_manager.dart';
import 'package:weather_now/presentation/resources/styles_manager.dart';
import 'package:weather_now/presentation/resources/values_manager.dart';

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
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),

    // elevated button theme

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularTextStyle(
          color: ColorManager.white,
          fontSize: FontSize.s17,
        ),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    // text theme

    textTheme: TextTheme(
      displayLarge: getSemiBoldTextStyle(
          color: ColorManager.darkGrey, fontSize: FontSize.s16),
      headlineLarge: getSemiBoldTextStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s16,
      ), // headline1
      headlineMedium: getRegularTextStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s14,
      ),
      titleMedium: getMediumTextStyle(
        color: ColorManager.lightGrey,
        fontSize: FontSize.s14,
      ), // subtitle1
      bodyLarge: getRegularTextStyle(color: ColorManager.grey1),
      bodySmall: getRegularTextStyle(
        color: ColorManager.grey1,
      ), // subtitle1
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularTextStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s14,
      ),
      labelStyle: getMediumTextStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s14,
      ),
      errorStyle: getRegularTextStyle(
        color: ColorManager.error,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
    ),
  );
}
