import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  static Color white = Colors.white;

  final Color primaryColor;

  const AppColors({
    required this.primaryColor,
  });

  @override
  AppColors copyWith({
    Color? primaryColor,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t) ?? other.primaryColor,
    );
  }
}
