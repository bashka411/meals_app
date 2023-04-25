import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/favourites_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/widgets/meal_item.dart';

class FavouritesScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMeals = ref.watch(favoutiresProvider);
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
