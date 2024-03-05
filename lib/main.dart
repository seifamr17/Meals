import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meals/models/favorite_meals.dart';
import 'package:meals/models/filtered_meals.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteMeals>(
          create: (BuildContext context) => FavoriteMeals(),
        ),
        ChangeNotifierProvider<FilteredMeals>(
          create: (BuildContext context) => FilteredMeals(),
        ),
      ],
      child: MaterialApp(
        theme: theme,
        home: const TabsScreen(),
      ),
    );
  }
}
