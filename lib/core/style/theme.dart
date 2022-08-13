import 'package:appfilmes/style/colors.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class MegaCineTheme {
  static final ThemeData ligth = ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.azulShade,
        titleTextStyle: TextStyle(
          color: AppColors.corFundo,
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins',
        ),
      ),
      tabBarTheme: const TabBarTheme(
          labelColor: AppColors.corFundo,
          unselectedLabelColor: AppColors.cinza),
      scaffoldBackgroundColor: AppColors.azulShade,
      primaryTextTheme: const TextTheme(
        bodyText1: TextStyle(color: AppColors.corFundo),
      ));

  static final ThemeData dark = ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.corFundo,
        titleTextStyle: TextStyle(
          color: AppColors.branco,
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          //fontFamily: 'Poppins',
        ),
      ),
      tabBarTheme: const TabBarTheme(
          labelColor: AppColors.laranja, unselectedLabelColor: AppColors.cinza),
      scaffoldBackgroundColor: AppColors.corFundo,
      primaryTextTheme: const TextTheme(
        bodyText1: TextStyle(color: AppColors.branco),
      ));
}

//Observação: a cor primaria blueGrey foi alterada no Material, ficando : -> static const int _blueGreyPrimaryValue = 0xFF201c1c;