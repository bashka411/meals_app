import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/selected_meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Color categoryColor;

  MealItem({
    @required this.meal,
    @required this.categoryColor,
  });

  String get getComplexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
    }
  }

  String get getAffordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
    }
  }

  void showSelectedMealDetailsScreen(BuildContext context) {
    Navigator.of(context).pushNamed(SelectedMealDetailsScreen.routeName,
        arguments: {'id': meal.id, 'categoryColor': categoryColor});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showSelectedMealDetailsScreen(context),
      child: Card(
        color: Color.lerp(categoryColor, Colors.white, .6),
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: meal,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      meal.imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      color: Color.lerp(categoryColor, Colors.white, 0.8)
                          .withOpacity(0.9),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      meal.title,
                      style: TextStyle(fontSize: 22),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.timelapse_outlined),
                      SizedBox(height: 5),
                      Text(
                        '${meal.duration} min',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.compare_arrows_outlined),
                      SizedBox(height: 5),
                      Text(
                        getComplexityText,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.attach_money_outlined),
                      SizedBox(height: 5),
                      Text(
                        getAffordabilityText.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
