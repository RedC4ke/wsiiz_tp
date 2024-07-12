import 'package:flutter/material.dart';

import 'package:wsiiz_tp/core/theme/app_text_theme.dart';

enum BorderType { disabled, enabled, focused, error, focusedError }

abstract class AppInputDecorationTheme {
  static const _padding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 13,
  );

  static final InputDecorationTheme themeLight = InputDecorationTheme(
    alignLabelWithHint: true,
    errorBorder: borderLight(BorderType.error),
    focusedBorder: borderLight(BorderType.focused),
    focusedErrorBorder: borderLight(BorderType.focusedError),
    enabledBorder: borderLight(BorderType.enabled),
    disabledBorder: borderLight(BorderType.disabled),
    filled: true,
    contentPadding: _padding,
    hintStyle: AppTextTheme.theme.bodyMedium?.copyWith(
      height: 1,
    ),
  );

  static InputBorder borderLight(BorderType type) {
    final radius = BorderRadius.circular(16);

    return OutlineInputBorder(
      borderRadius: radius,
    );
  }
}
