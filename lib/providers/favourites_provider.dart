import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesNotifier extends StateNotifier<List<Meal>> {
  FavouritesNotifier() : super([]);

  bool toggleFavouriteStatus(Meal meal) {
    final mealIsFavourite = state.contains(meal);

    if (mealIsFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }
    state = [...state, meal];
    return true;
  }

  bool isMealFavourited(Meal meal) {
    return state.contains(meal);
  }
}

final favoutiresProvider =
    StateNotifierProvider<FavouritesNotifier, List<Meal>>(
        (ref) => FavouritesNotifier());
