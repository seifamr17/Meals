import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/filters_screen.dart';

class FilteredMeals with ChangeNotifier {
  List<String> _filteredMealsIDs = dummyMeals.map((meal) => meal.id).toList();

  Map<Filter, bool> _filterSet = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegan: false,
    Filter.vegetarian: false,
  };

  Map<Filter, bool> get filters {
    return _filterSet;
  }

  void filterMeals() {
    _filteredMealsIDs = dummyMeals
        .where((meal) {
          if (_filterSet[Filter.glutenFree]! && !meal.isGlutenFree) {
            return false;
          }
          if (_filterSet[Filter.lactoseFree]! && !meal.isLactoseFree) {
            return false;
          }
          if (_filterSet[Filter.vegan]! && !meal.isVegan) {
            return false;
          }
          if (_filterSet[Filter.vegetarian]! && !meal.isVegetarian) {
            return false;
          }
          return true;
        })
        .map((meal) => meal.id)
        .toList();
    notifyListeners();
  }

  List<String> get filteredMeals {
    return dummyMeals.map((e) => e.id).toList();
  }

  void setFilters(Map<Filter, bool>? newFilters) {
    _filterSet = newFilters ?? _filterSet;
    if (newFilters != null) {
      filterMeals();
    }
  }

  void setSingleFilter(Filter selectedFilter, bool isChecked) {
    _filterSet[selectedFilter] = isChecked;
    filterMeals();
  }

  bool contains(String id) {
    return _filteredMealsIDs.contains(id);
  }
}
