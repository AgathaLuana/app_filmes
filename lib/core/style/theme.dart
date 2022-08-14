import 'package:flutter/material.dart';

import 'app_colors.dart';

class MegaCineTheme {
  static final ThemeData ligth = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.corFundoClaro,
      titleTextStyle: TextStyle(
        color: AppColors.preto,
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
      ),
    ),
    tabBarTheme: const TabBarTheme(
        labelColor: AppColors.preto, unselectedLabelColor: AppColors.cinza),
    scaffoldBackgroundColor: AppColors.corFundoClaro,
   
  );

  static final ThemeData dark = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.corFundo,
      titleTextStyle: TextStyle(
        color: AppColors.laranja,
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
      ),
    ),
    tabBarTheme: const TabBarTheme(
        labelColor: AppColors.laranja,
        unselectedLabelColor: AppColors.cinza
        ),
    
    
    scaffoldBackgroundColor: AppColors.corFundo,
  );
}

//Observação: a cor primaria blueGrey foi alterada no Material, ficando : -> static const int _blueGreyPrimaryValue = 0xFF201c1c;