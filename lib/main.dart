import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_complete_guide/screens/tabs_screen.dart';
import 'package:flutter_complete_guide/screens/selected_category_meals_screen.dart';
import 'package:flutter_complete_guide/screens/selected_meal_details_screen.dart';

void main() => runApp(
      ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends ConsumerStatefulWidget {
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.cyan,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              bodyMedium: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontSize: 16,
              ),
              titleMedium: TextStyle(
                fontSize: 25,
                color: Color.fromRGBO(20, 51, 51, 1),
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      home: TabsScreen(),
      routes: {
        SelectedCategoryMealsScreen.routeName: (context) =>
            SelectedCategoryMealsScreen(),
        SelectedMealDetailsScreen.routeName: (context) =>
            SelectedMealDetailsScreen(),
      },
    );
  }
}
