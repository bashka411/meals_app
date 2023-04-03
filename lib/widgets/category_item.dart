import 'package:flutter/material.dart';
import '/models/meal.dart';
import '/screens/selected_category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final List<Meal> availableMeals;

  CategoryItem({this.id, this.title, this.color, this.availableMeals});

  int get getCategoryMealsAmount {
    return availableMeals.where((meal) => meal.categoryId.contains(id)).length;
  }

  void showSelectedCategoryScreen(BuildContext context) {
    Navigator.of(context).pushNamed(
      SelectedCategoryMealsScreen.routeName,
      arguments: {
        'categoryId': id,
        'categoryTitle': title,
        'categoryColor': color
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: color,
      onTap: () => showSelectedCategoryScreen(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                getCategoryMealsAmount.toString(),
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.5), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
    );
  }
}
