import 'package:flutter/material.dart';

import '../data.dart';
import '/widgets/category_item.dart';

class CategoriesListScreen extends StatefulWidget {
  @override
  State<CategoriesListScreen> createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends State<CategoriesListScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 250),
        lowerBound: 0,
        upperBound: 1);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(5),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        children: CATEGORIES
            .map(
              (category) => CategoryItem(
                id: category.id,
                title: category.title,
                color: category.color,
              ),
            )
            .toList(),
      ),
      builder: (context, child) => Container(
        color: Theme.of(context).primaryColor.withOpacity(0.15),
        child: SlideTransition(
          position: Tween(
              begin: const Offset(0, 1),
              end: const Offset(0, 0),
            ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)),
          child: child,
        ),
      ),
    );
  }
}
