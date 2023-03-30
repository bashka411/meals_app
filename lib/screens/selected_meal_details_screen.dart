import 'package:flutter/material.dart';

import '../data.dart';

class SelectedMealDetailsScreen extends StatelessWidget {
  static const routeName = '/selected-meal-details-screen';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final mealId = arguments['id'] as String;
    final categoryColor = arguments['categoryColor'] as Color;
    print(mealId);
    print(categoryColor);
    final meal = MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [categoryColor.withOpacity(0.7), categoryColor]),
          ),
        ),
        title: FittedBox(
          child: Text(
            meal.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
      body: Container(
        color: categoryColor.withOpacity(0.15),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Hero(
                      tag: meal,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          meal.imageUrl,
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                    child: Text(
                      'Ingridients',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (ctx, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    color: Color.lerp(categoryColor, Colors.white, .65),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        meal.ingredients[index],
                      ),
                    ),
                  ),
                ),
                childCount: meal.ingredients.length,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                    child: Text(
                      'Steps',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            Color.lerp(categoryColor, Colors.white, .3),
                        child: Text(
                          '${(index + 1)}',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      title: Text(
                        meal.steps[index],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Divider()
                  ],
                ),
                childCount: meal.steps.length,
              ),
            ),
          ],
        ),
      ),
      // child: SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: <Widget>[
      //       Padding(
      //         padding: const EdgeInsets.all(5),
      //         child: Hero(
      //           tag: meal,
      //           child: ClipRRect(
      //             borderRadius: BorderRadius.circular(10),
      //             child: Image.network(
      //               meal.imageUrl,
      //               height: 300,
      //               width: double.infinity,
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //       ),
      //       Container(
      //         margin: EdgeInsets.symmetric(vertical: 10),
      //         child: Text(
      //           'Ingredients',
      //           style: Theme.of(context).textTheme.bodyLarge,
      //         ),
      //       ),
      //       Container(
      //         margin: EdgeInsets.all(10),
      //         padding: EdgeInsets.all(10),
      //         height: 300,
      //         child: ListView.builder(
      //           physics: NeverScrollableScrollPhysics(),
      //           itemBuilder: (ctx, index) => Card(
      //             color: Color.lerp(categoryColor, Colors.white, .6),
      //             child: Padding(
      //                 padding: EdgeInsets.symmetric(
      //                   vertical: 5,
      //                   horizontal: 10,
      //                 ),
      //                 child: Text(meal.ingredients[index])),
      //           ),
      //           itemCount: meal.ingredients.length,
      //         ),
      //       ),
      //       Container(
      //         margin: EdgeInsets.symmetric(vertical: 10),
      //         child: Text(
      //           'Steps',
      //           style: Theme.of(context).textTheme.bodyLarge,
      //         ),
      //       ),
      //       Container(
      //         margin: EdgeInsets.all(10),
      //         padding: EdgeInsets.all(10),
      //         height: 450,
      //         child: ListView.builder(
      //           itemBuilder: (ctx, index) => Column(
      //             children: [
      //               ListTile(
      //                 leading: CircleAvatar(
      //                   backgroundColor:
      //                       Color.lerp(categoryColor, Colors.white, .3),
      //                   child: Text(
      //                     '${(index + 1)}',
      //                     textAlign: TextAlign.center,
      //                     style: TextStyle(fontSize: 20, color: Colors.white),
      //                   ),
      //                 ),
      //                 title: Text(
      //                   meal.steps[index],
      //                   style: Theme.of(context).textTheme.bodyMedium,
      //                 ),
      //               ),
      //               Divider()
      //             ],
      //           ),
      //           itemCount: meal.steps.length,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
