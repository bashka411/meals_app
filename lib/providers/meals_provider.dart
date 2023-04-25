import 'package:flutter_complete_guide/data.dart';
import 'package:riverpod/riverpod.dart';

final mealsProvider = Provider((ref) {
  return MEALS;
});
