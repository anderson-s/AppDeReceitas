import 'package:app_receitas/models/dummy_data.dart';
import 'package:app_receitas/views/components/meal_item.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  // final Category category;
  const CategoriesMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categoryMeals = dummyMeals
        .where((element) => element.categories.contains(category.id))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(category.title),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(meal: categoryMeals[index]);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
