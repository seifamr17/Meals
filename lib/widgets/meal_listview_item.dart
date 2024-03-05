import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details_screen.dart';

class MealListViewItem extends StatelessWidget {
  const MealListViewItem(this.meal, {super.key});

  final Meal meal;

  Widget getIconLabel({required IconData icon, required String label}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Hero(
        tag: meal.id,
        child: Material(
          child: Ink(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => MealDetailsScreen(meal: meal)),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                height: 200.0,
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 80.0,
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        meal.title,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getIconLabel(
                            icon: Icons.access_time,
                            label: ' ${meal.duration} min',
                          ),
                          const SizedBox(width: 10.0),
                          getIconLabel(
                            icon: Icons.work,
                            label: ' ${meal.capitalizedComplexity}',
                          ),
                          const SizedBox(width: 10.0),
                          getIconLabel(
                            icon: Icons.attach_money,
                            label: ' ${meal.capitalizedAffordability}',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
