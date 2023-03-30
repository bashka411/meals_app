import 'package:flutter/material.dart';
import '../screens/selected_category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.id, this.title, this.color});

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
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
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
