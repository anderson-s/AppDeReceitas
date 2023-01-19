import 'package:app_receitas/models/dummy_data.dart';
import 'package:app_receitas/models/filters.dart';
import 'package:app_receitas/models/meal.dart';
import 'package:app_receitas/models/utils/routes.dart';
import 'package:app_receitas/views/categories_meals_screen.dart';
import 'package:app_receitas/views/categories_screen.dart';
import 'package:app_receitas/views/meal_detail.dart';
import 'package:app_receitas/views/settings.dart';
import 'package:app_receitas/views/tabs.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Filtres estados = Filtres();
  List<Meal> comidasDisponiveis = dummyMeals;

  void filtrarComidas(Filtres filtros) {
    setState(() {
      estados = filtros;
      comidasDisponiveis = dummyMeals.where(
        (element) {
          final filtroGluten = filtros.isGlutenFree && !element.isGlutenFree;
          final filtroLactose = filtros.isLactoseFree && !element.isLactoseFree;
          final filtroVegan = filtros.isVegan && !element.isVegan;
          final filtroVegetarian =
              filtros.isVegetarian && !element.isVegetarian;
          return !filtroGluten &&
              !filtroLactose &&
              !filtroVegan &&
              !filtroVegetarian;
        },
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tema = ThemeData();
    return MaterialApp(
      title: "Receitas",
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        textTheme: tema.textTheme.copyWith(
          headline6: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.home: (context) => const Tabs(),
        Routes.categoriesMeals: (context) =>
            CategoriesMealsScreen(meals: comidasDisponiveis),
        Routes.mealDetail: (context) => const MealDetail(),
        Routes.settings: (context) => Settings(filtros: filtrarComidas, estados: estados,),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
            return const CategoriesScreen();
          },
        );
      },
    );
  }
}
