import 'package:flutter_complete_guide/data.dart';
import 'package:riverpod/riverpod.dart';

final categoriesProvider = Provider((ref) {
  return CATEGORIES;
});
