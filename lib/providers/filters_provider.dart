import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersNotifier extends StateNotifier<Filters> {
  FiltersNotifier() : super(Filters());

  setNewFilterSettings({
    isGlutenFree = false,
    isLactoseFree = false,
    isVegetarian = false,
    isVegan = false,
  }) {
    state = Filters(
      isGlutenFree: isGlutenFree,
      isLactoseFree: isLactoseFree,
      isVegetarian: isVegetarian,
      isVegan: isVegan,
    );
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Filters>((ref) => FiltersNotifier());

class Filters {
  bool isGlutenFree;
  bool isLactoseFree;
  bool isVegetarian;
  bool isVegan;

  Filters({
    this.isGlutenFree = false,
    this.isLactoseFree = false,
    this.isVegetarian = false,
    this.isVegan = false,
  });
}
