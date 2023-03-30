import 'package:flutter/material.dart';

import '../data.dart';
import '../widgets/category_item.dart';

class CategoriesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // appBar: AppBar(
    //   backgroundColor: Colors.white,
    //   centerTitle: true,
    //   title: Text(
    //     'Pjortzence',
    //     style: Theme.of(context).textTheme.bodyLarge,
    //   ),
    //   flexibleSpace: Container(
    //     decoration: BoxDecoration(
    //       gradient: LinearGradient(
    //           begin: Alignment.centerLeft,
    //           end: Alignment.centerRight,
    //           colors: [
    //             Theme.of(context).primaryColor.withOpacity(0.7),
    //             Theme.of(context).primaryColor
    //           ]),
    //     ),
    //   ),
    // ),
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
                id: category.id, title: category.title, color: category.color))
            .toList(),
      ),
    );
  }
}
