import 'package:flutter/material.dart';

class FavoriteMeals with ChangeNotifier {
  final List<String> _favoriteMealsIDs = [];

  List<String> get favorites {
    return _favoriteMealsIDs;
  }

  bool contains(String id) {
    return _favoriteMealsIDs.contains(id);
  }

  void addMeal(String id) {
    _favoriteMealsIDs.add(id);
    notifyListeners();
  }

  void removeMeal(String id) {
    _favoriteMealsIDs.remove(id);
    notifyListeners();
  }

  void toggleMeal(String id) {
    if (_favoriteMealsIDs.contains(id)) {
      removeMeal(id);
    } else {
      addMeal(id);
    }
  }
}
