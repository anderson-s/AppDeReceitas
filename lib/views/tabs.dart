import 'package:app_receitas/views/categories_screen.dart';
import 'package:app_receitas/views/meals_favorite.dart';
import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Vamos Cozinhar?"),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: "Categorias",
            ),
            Tab(
              icon: Icon(Icons.star),
              text: "Favoritos",
            ),
          ]),
        ),
        body: const TabBarView(
          children: [
            CategoriesScreen(),
            MealsFavorite(),
          ],
        ),
      ),
    );
  }
}
