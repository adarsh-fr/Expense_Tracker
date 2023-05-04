import 'package:flutter/material.dart';

import 'package:expense_tracker/main_screen.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(90, 64, 67, 255),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(90, 64, 67, 255),
  brightness: Brightness.dark,
);
void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          //color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          shadowColor: const Color.fromARGB(255, 12, 73, 227),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(253, 64, 67, 255),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: Colors.white,
        ),
        cardTheme: const CardTheme().copyWith(
          //color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          shadowColor: const Color.fromARGB(255, 12, 73, 227),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(253, 64, 67, 255),
            foregroundColor: Colors.white,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(90, 64, 67, 255),
                  fontSize: 15),
            ),
      ),
      themeMode: ThemeMode.light,
      home: const Expenses(),
    ),
  );
}
