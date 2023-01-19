import 'package:app_receitas/models/meal.dart';
import 'package:app_receitas/views/components/meal_item.dart';
import 'package:flutter/material.dart';

class MealsFavorite extends StatelessWidget {
  final List<Meal> comidasFavoritas;
  const MealsFavorite({super.key, required this.comidasFavoritas});

  @override
  Widget build(BuildContext context) {
    if (comidasFavoritas.isEmpty) {
      return const Center(
        child: Text("Nenhuma comida foi marcada como favorita!"),
      );
    } else {
      return ListView.builder(
        itemCount: comidasFavoritas.length,
        itemBuilder: (context, index) {
          return MealItem(meal: comidasFavoritas[index]);
        },
      );
    }
  }
}
