import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/widgets/filters_drawer.dart';
import 'categories_list_screen.dart';
import 'favourites_screen.dart';

class TabsScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> _pages = [
      {
        'page': CategoriesListScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouritesScreen(),
        'title': 'Favourites',
      },
    ];

    return Scaffold(
      onEndDrawerChanged: (isOpened) => {},
      endDrawer: FiltersDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.filter_alt_rounded, color: Colors.white),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            );
          })
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          _pages[_selectedPageIndex]['title'] as String,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.7),
                Theme.of(context).primaryColor,
              ],
            ),
          ),
        ),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _selectPage(index),
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category_rounded),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite_rounded),
              label: 'Favourites'),
        ],
      ),
    );
  }
}
