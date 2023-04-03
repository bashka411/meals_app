import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Drawer(
      backgroundColor:
          Color.lerp(Theme.of(context).primaryColor, Colors.white, 0.8),
      child: Column(
        children: [
          Container(
            height: 108.5,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(
                top: mediaQuery.viewPadding.top + 12,
                right: 12,
                bottom: 12,
                left: 12),
            width: double.infinity,
            child: Center(
              child: Text(
                'Cooking Up!',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    const Icon(Icons.restaurant_rounded, size: 40),
                    const Text(
                      'Meals',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
              },
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    const Icon(Icons.filter_alt_rounded, size: 40),
                    const Text(
                      'Filters',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
