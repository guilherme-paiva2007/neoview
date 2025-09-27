import 'package:flutter/material.dart' show TextStyle, FontWeight;
import 'package:neoview/core/constants/colors.dart';

abstract final class AppTextStyles {
  static const text = TextStyle(
    fontSize: 14,
  );
  static const bold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const label = TextStyle(
    fontSize: 16,
  );

  static const title = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  static const subtitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  static const hollowButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const article = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}