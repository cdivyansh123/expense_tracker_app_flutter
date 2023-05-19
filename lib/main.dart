import 'package:expense_tracker_app_flutter/widgets/expenses.dart';
import 'package:flutter/material.dart';

var KcolorScheme =
    ColorScheme.fromSeed(

        seedColor: Color.fromARGB(255, 96, 59, 181));

var kDarkScheme =
    ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: Color.fromARGB(255, 5, 99, 125)
    );

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkScheme,
      cardTheme: CardTheme().copyWith(
        color: kDarkScheme.secondaryContainer,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kDarkScheme.primaryContainer,
          foregroundColor: kDarkScheme.onPrimaryContainer
        ),
      ),
    ),
    theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: KcolorScheme,
        appBarTheme: AppBarTheme().copyWith(
            backgroundColor: KcolorScheme.onPrimaryContainer,
            foregroundColor: KcolorScheme.primaryContainer),
        cardTheme: CardTheme().copyWith(
          color: KcolorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: KcolorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: KcolorScheme.onSecondaryContainer,
              fontSize: 16,
            ))),
    // themeMode: ThemeMode.system,
    home: Expense(),
    debugShowCheckedModeBanner: false,
  ));
}
