import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/categories_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/widgets/category_item.dart';

class CategoriesListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var categories = ref.watch(categoriesProvider);
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
        children: categories
            .map(
              (category) => CategoryItem(
                id: category.id,
                title: category.title,
                color: category.color,
              ),
            )
            .toList(),
      ),
    );
  }
}
