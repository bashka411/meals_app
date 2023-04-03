import 'package:flutter/material.dart';

import '../data.dart';
import '/models/meal.dart';
import '/widgets/category_item.dart';

class CategoriesListScreen extends StatelessWidget {
  final List<Meal> availableMeals;
  CategoriesListScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.15),
      child: GridView(
        padding: const EdgeInsets.all(5),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        children: CATEGORIES
            .map((category) => CategoryItem(
                id: category.id,
                title: category.title,
                color: category.color,
                availableMeals: availableMeals))
            .toList(),
      ),
    );
  }
}
