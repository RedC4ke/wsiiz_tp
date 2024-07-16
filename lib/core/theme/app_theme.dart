import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:wsiiz_tp/core/theme/app_input_decoration_theme.dart';
import 'package:wsiiz_tp/core/theme/app_text_theme.dart';

abstract class AppTheme {
  static ThemeMode themeMode = ThemeMode.system;

  static bool isDarkMode() {
    return themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            SchedulerBinding.instance.platformDispatcher.platformBrightness ==
                Brightness.dark);
  }

  static ThemeData get themeData => ThemeData(
        brightness: isDarkMode() ? Brightness.dark : Brightness.light,
        useMaterial3: true,
        textTheme: AppTextTheme.theme,

        appBarTheme: AppBarTheme(
          titleTextStyle: AppTextTheme.theme.labelLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
          backgroundColor: Colors.transparent,
        ),
        //! Buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            shape: const StadiumBorder(),
            textStyle: AppTextTheme.theme.labelSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
            elevation: 0,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(16),
            textStyle: AppTextTheme.theme.labelMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        inputDecorationTheme: AppInputDecorationTheme.themeLight,
        sliderTheme: SliderThemeData(
          trackHeight: 6,
          thumbColor: Colors.transparent,
          thumbShape: SliderComponentShape.noThumb,
        ),
        dividerTheme: const DividerThemeData(
          thickness: 1,
        ),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedLabelStyle: AppTextTheme.theme.labelExtraSmallBold,
          unselectedLabelStyle: AppTextTheme.theme.labelExtraSmallBold,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
        tabBarTheme: TabBarTheme(
          labelStyle: AppTextTheme.theme.labelMediumBold,
          unselectedLabelStyle: AppTextTheme.theme.labelMediumBold,
          dividerHeight: 0,
          indicator: const BoxDecoration(
            border: Border(
              bottom: BorderSide(),
            ),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          tabAlignment: TabAlignment.fill,
        ),

        timePickerTheme: TimePickerThemeData(
          confirmButtonStyle: ElevatedButton.styleFrom(),
          helpTextStyle: AppTextTheme.theme.headlineSmall,
          timeSelectorSeparatorTextStyle: const WidgetStatePropertyAll(
            TextStyle(
              fontSize: 44,
            ),
          ),
        ),
        chipTheme: const ChipThemeData(
          shape: StadiumBorder(),
        ),
        segmentedButtonTheme: SegmentedButtonThemeData(
          style: SegmentedButton.styleFrom(
            shape: const StadiumBorder(),
            textStyle: AppTextTheme.theme.labelSmallBold,
          ),
        ),
        searchBarTheme: SearchBarThemeData(
          elevation: const WidgetStatePropertyAll(0),
          textStyle: WidgetStatePropertyAll(AppTextTheme.theme.labelMedium),
          hintStyle: WidgetStatePropertyAll(
            AppTextTheme.theme.labelMedium,
          ),
          constraints: const BoxConstraints(),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          width: 800,
        ),
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
      );
}

extension XTextTheme on TextTheme {
  TextStyle? get bodyExtraSmall => bodySmall?.copyWith(
        fontSize: 12,
        height: 18 / 12,
      );

  TextStyle? get headlineExtraSmall => headlineSmall?.copyWith(
        fontSize: 16,
        height: 19 / 16,
        fontWeight: FontWeight.w700,
      );

  TextStyle? get labelMediumBold => labelMedium?.copyWith(
        fontWeight: FontWeight.w700,
      );

  TextStyle? get labelSmallBold => labelSmall?.copyWith(
        fontWeight: FontWeight.w700,
      );

  TextStyle? get labelExtraSmall => labelSmall?.copyWith(
        fontSize: 12,
      );

  TextStyle? get labelExtraSmallBold => labelSmall?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w700,
      );
}
