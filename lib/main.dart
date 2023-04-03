import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/selected_category_meals_screen.dart';
import './screens/selected_meal_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontSize: 24,
              ),
              bodyMedium: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontSize: 18,
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
        SelectedCategoryMealsScreen.routeName: (context) => SelectedCategoryMealsScreen(),
        SelectedMealDetailsScreen.routeName: (context) => SelectedMealDetailsScreen(),
      },
    );
  }
}
