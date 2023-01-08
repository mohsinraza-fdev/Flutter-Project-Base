import 'package:base/shared/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static AppColors? colors(BuildContext context) => Theme.of(context).extension<AppColors>();

  static ThemeData get light => ThemeData.light().copyWith(
        extensions: const <ThemeExtension<dynamic>>[
          AppColors(
            primaryColor: Color(0xFF3282B8),
          ),
        ],
      );

  static ThemeData get dark => ThemeData.dark().copyWith(
        extensions: const <ThemeExtension<dynamic>>[
          AppColors(
            primaryColor: Color.fromARGB(255, 93, 121, 143),
          ),
        ],
      );
}
