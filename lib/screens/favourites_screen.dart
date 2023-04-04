import 'package:flutter/material.dart';

import '/widgets/meal_item.dart';
import '/models/meal.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('Your favourite meals!'),
      );
    } else {
      return Container(
        color: Theme.of(context).primaryColor.withOpacity(0.15),
        child: ListView.builder(
            itemBuilder: (context, index) {
              return MealItem(
                meal: favouriteMeals[index],
                categoryColor: Theme.of(context).primaryColor,
              );
            },
            itemCount: favouriteMeals.length),
      );
    }
  }
}
