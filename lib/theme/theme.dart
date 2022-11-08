import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {

  static ThemeData build({
    required Brightness brightness,
    Color? seed
  }) {
    bool darkMode = brightness == Brightness.dark;
    if (seed == null) seed = HexColor.fromHex('#a5ace2');
    Color contrastTextColor = brightness == Brightness.light ? Colors.black : Colors.white;
    Color contrastTextColorLight = brightness == Brightness.light ? Colors.grey[700]! : Colors.grey[200]!;
    Color background = brightness == Brightness.light ? HexColor.fromHex('#f8faf9') : Color.fromARGB(255, 16, 16, 16);
    Color surfaceVariant = brightness == Brightness.light ? HexColor.fromHex('#ffffff') : HexColor.fromHex('#222222');
    ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: brightness
    ).copyWith(
      background: background,
      surfaceVariant: surfaceVariant
    );
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Google Sans',
      colorScheme: colorScheme,
      useMaterial3: true,
      backgroundColor: background,
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: background,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontFamily: 'Google Sans',
          fontWeight: FontWeight.w500,
          color: colorScheme.onBackground
        ),
        surfaceTintColor: colorScheme.surfaceVariant
      ),
      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        enableFeedback: true,
        elevation: 1
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        actionsPadding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
        titleTextStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 24,
          color: contrastTextColor
        ),
        contentTextStyle: TextStyle(
          fontFamily: 'Google Sans',
          fontSize: 16,
          color: contrastTextColorLight
        )
      ),
      tooltipTheme: const TooltipThemeData(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        preferBelow: true,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 17,
            vertical: 13
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          textStyle: TextStyle(
            fontFamily: 'Inter',
          )
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: colorScheme.onPrimary,
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          enableFeedback: true,
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 15
          ),
          textStyle: TextStyle(
            fontSize: 15,
            fontFamily: 'Inter',
          ),
        )
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
      ),
      listTileTheme: ListTileThemeData(
        tileColor: surfaceVariant,
        minLeadingWidth: 12
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Inter',
          color: contrastTextColor
        ),
        displayMedium: TextStyle(
          fontFamily: 'Inter',
          color: contrastTextColor
        ),
        displaySmall: TextStyle(
          fontFamily: 'Inter',
          color: contrastTextColor
        ),
        titleLarge: TextStyle(
          fontFamily: 'Inter',
          color: contrastTextColor
        ),
        titleMedium: TextStyle(
          fontFamily: 'Inter',
          color: contrastTextColor
        ),
        titleSmall: TextStyle(
          fontFamily: 'Inter',
          color: contrastTextColor
        ),
        headlineLarge: TextStyle(
          fontFamily: 'Inter',
          color: contrastTextColor
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Inter',
          color: contrastTextColor
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Inter',
          color: contrastTextColorLight
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Google Sans',
          color: contrastTextColor
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Google Sans',
          color: contrastTextColor
        ),
        bodySmall: TextStyle(
          fontFamily: 'Google Sans',
          color: contrastTextColorLight
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        linearMinHeight: 4,
        color: contrastTextColorLight,
        linearTrackColor: contrastTextColorLight.withOpacity(0.05)
      ),
      cardTheme: CardTheme(
        elevation: 0.5,
        shadowColor: HexColor.fromHex('#B5A9A1'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0.5,
        enableFeedback: true,
        showSelectedLabels: true,
        showUnselectedLabels: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkMode ? Colors.grey[900] : Colors.grey[100],
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        hintStyle: TextStyle(
          fontFamily: 'Google Sans'
        ),
      ),
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.orange.withOpacity(.48);
          }
          return Colors.orange;
        }),
        thumbColor: MaterialStateProperty.all(Colors.blue),
      ),
      dividerTheme: DividerThemeData(
        endIndent: 18,
        indent: 18,
        color: darkMode ? Colors.grey[800] : Colors.grey[300]
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        )
      ),
    );
  }

}