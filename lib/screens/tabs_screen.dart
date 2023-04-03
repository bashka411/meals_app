import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

import './categories_list_screen.dart';
import './favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
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
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_rounded),
            onPressed: () {},
          )
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          _pages[_selectedPageIndex]['title'],
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
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _selectPage(index),
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
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

    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Colors.white,
    //       centerTitle: true,
    //       title: Text(
    //         'Pjortzence Meal Recipes',
    //         style: Theme.of(context).textTheme.bodyLarge,
    //       ),
    //       flexibleSpace: Container(
    //         decoration: BoxDecoration(
    //           gradient: LinearGradient(
    //               begin: Alignment.centerLeft,
    //               end: Alignment.centerRight,
    //               colors: [
    //                 Theme.of(context).primaryColor.withOpacity(0.7),
    //                 Theme.of(context).primaryColor
    //               ]),
    //         ),
    //       ),
    //       bottom: TabBar(
    //         indicatorColor: Colors.black,
    //         tabs: [
    //           Tab(
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Icon(Icons.category_rounded),
    //                 SizedBox(width: 10),
    //                 Text('Categories',
    //                     style: Theme.of(context).textTheme.bodyMedium),
    //               ],
    //             ),
    //           ),
    //           Tab(
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Icon(Icons.favorite_rounded),
    //                 SizedBox(width: 10),
    //                 Text('Favourites',
    //                     style: Theme.of(context).textTheme.bodyMedium),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [CategoriesListScreen(), FavouritesScreen()],
    //     ),
    //   ),
    // );
  }
}
