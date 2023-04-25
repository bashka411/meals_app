import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/meals_provider.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedCategoryMealsScreen extends ConsumerWidget {
  static const routeName = '/selected-category-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meals = ref.watch(mealsProvider);
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final categoryId = routeArguments['categoryId'] as String;
    final categoryTitle = routeArguments['categoryTitle'] as String;
    final categoryColor = routeArguments['categoryColor'] as Color;
    final categoryMeals = meals.where((meal) {
      return meal.categoryId.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [categoryColor.withOpacity(0.7), categoryColor]),
          ),
        ),
        title: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Container(
        color: categoryColor.withOpacity(0.15),
        child: ListView.builder(
            itemBuilder: (context, index) {
              return MealItem(
                meal: categoryMeals[index],
                categoryColor: categoryColor,
              );
            },
            itemCount: categoryMeals.length),
      ),
    );
  }
}
