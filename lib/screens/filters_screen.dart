import 'package:flutter/material.dart';
import 'package:meals/models/filtered_meals.dart';
import 'package:meals/widgets/filter_switch_item.dart';
import 'package:provider/provider.dart';

enum Filter { glutenFree, lactoseFree, vegan, vegetarian }

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  void toggleSwitch(
      BuildContext context, Filter selectedSwitch, bool isChecked) {
    Provider.of<FilteredMeals>(context, listen: false)
        .setSingleFilter(selectedSwitch, isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          FilterSwitchItem(
            title: 'Gluten-Free',
            subtitle: 'Only include gluten-free meals.',
            isSet:
                Provider.of<FilteredMeals>(context).filters[Filter.glutenFree]!,
            onChanged: (isChecked) =>
                toggleSwitch(context, Filter.glutenFree, isChecked),
          ),
          FilterSwitchItem(
            title: 'Lactose-Free',
            subtitle: 'Only include lactose-free meals.',
            isSet: Provider.of<FilteredMeals>(context)
                .filters[Filter.lactoseFree]!,
            onChanged: (isChecked) =>
                toggleSwitch(context, Filter.lactoseFree, isChecked),
          ),
          FilterSwitchItem(
            title: 'Vegan',
            subtitle: 'Only include vegan meals.',
            isSet: Provider.of<FilteredMeals>(context).filters[Filter.vegan]!,
            onChanged: (isChecked) =>
                toggleSwitch(context, Filter.vegan, isChecked),
          ),
          FilterSwitchItem(
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
            isSet:
                Provider.of<FilteredMeals>(context).filters[Filter.vegetarian]!,
            onChanged: (isChecked) =>
                toggleSwitch(context, Filter.vegetarian, isChecked),
          ),
        ],
      ),
    );
  }
}
