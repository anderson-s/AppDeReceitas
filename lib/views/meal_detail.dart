import 'package:app_receitas/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ...meal.ingredients.map((e) => Text(e)).toList(),
        ],
      ),
    );
  }
}
