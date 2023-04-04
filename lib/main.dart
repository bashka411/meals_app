import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/data.dart';
import 'package:flutter_complete_guide/models/filters.dart';

import 'screens/tabs_screen.dart';
import 'screens/selected_category_meals_screen.dart';
import 'screens/selected_meal_details_screen.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Filters _filters = Filters();

  List<Meal> _filteredMeals = MEALS;
  List<Meal> _favouriteMeals = [];

  void setFilters(Filters filterData) {
    print(
        'main.dart _setFilters() called with isGlutenFree: ${filterData.isGlutenFree}, isLactoseFree: ${filterData.isLactoseFree},  isVegan: ${filterData.isVegan}, isVegetarian: ${filterData.isVegetarian},');
    setState(() {
      _filters = filterData;

      _filteredMeals = MEALS.where((meal) {
        if (_filters.isGlutenFree && !meal.isGlutenFree) {
          return false;
        }
        if (_filters.isLactoseFree && !meal.isLactoseFree) {
          return false;
        }
        if (_filters.isVegan && !meal.isVegan) {
          return false;
        }
        if (_filters.isVegetarian && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final index = _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (index >= 0)
      setState(
        () => _favouriteMeals.removeAt(index),
      );
    else
      setState(
        () => _favouriteMeals.add(
          MEALS.firstWhere((meal) => meal.id == mealId),
        ),
      );
      print('_toggleFavourite() index: $index');
  }

  bool _isMealFavourited(String mealId) {
    return _favouriteMeals.any((meal) => meal.id == mealId);
  }

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
                fontSize: 20,
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
      home: TabsScreen(setFilters, _filteredMeals, _filters, _favouriteMeals),
      routes: {
        SelectedCategoryMealsScreen.routeName: (context) =>
            SelectedCategoryMealsScreen(_filteredMeals),
        SelectedMealDetailsScreen.routeName: (context) =>
            SelectedMealDetailsScreen(_toggleFavourite, _isMealFavourited),
      },
    );
  }
}
