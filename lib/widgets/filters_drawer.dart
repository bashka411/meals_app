import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/providers/filters_provider.dart';

class FiltersDrawer extends ConsumerStatefulWidget {
  @override
  ConsumerState<FiltersDrawer> createState() => _FiltersDrawerState();
}

class _FiltersDrawerState extends ConsumerState<FiltersDrawer> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;
  final filterProvider = null;

  @override
  void initState() {
    final filterProvider = ref.watch(filtersProvider);
    _isGlutenFree = filterProvider.isGlutenFree;
    _isLactoseFree = filterProvider.isLactoseFree;
    _isVegetarian = filterProvider.isVegetarian;
    _isVegan = filterProvider.isVegan;
    super.initState();
  }

  SwitchListTile _buildSwitchListTile(
      String title, String subtitle, bool valvalue, /*Function updateValue*/) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: valvalue,
      onChanged: null /*updateValue*/,
    );
  }

  void _setFilters() {
    Filters filters = Filters(
      isGlutenFree: _isGlutenFree,
      isLactoseFree: _isLactoseFree,
      isVegetarian: _isVegetarian,
      isVegan: _isVegan,
    );

    // filters.setNewFilterSettings(filters);

    print('$filters');
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Drawer(
      backgroundColor:
          Color.lerp(Theme.of(context).primaryColor, Colors.white, 0.8),
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(
                top: mediaQuery.viewPadding.top + 12,
                right: 12,
                bottom: 12,
                left: 12),
            width: double.infinity,
            child: Center(
              child: Text(
                'Filters',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildSwitchListTile(
                  'Gluten-free',
                  'Exclude meals that contain gluten',
                  _isGlutenFree,
                  //(valvalue) => setState(() => _isGlutenFree = valvalue),
                ),
                Divider(height: 0, thickness: 1),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Exclude meals that contain lactose',
                  _isLactoseFree,
                  //(valvalue) => setState(() => _isLactoseFree = valvalue),
                ),
                Divider(height: 0, thickness: 1),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Exclude any meals that contain meat or fish',
                  _isVegetarian,
                  //(valvalue) => setState(() => _isVegetarian = valvalue),
                ),
                Divider(height: 0, thickness: 1),
                _buildSwitchListTile(
                  'Vegan',
                  'Exclude any meals that contain animal products',
                  _isVegan,
                 // (valvalue) => setState(() => _isVegan = valvalue),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      _setFilters();
                      Navigator.of(context).pop();
                    },
                    child: Text('Apply filters'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
