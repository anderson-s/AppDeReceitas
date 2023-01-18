import 'package:app_receitas/models/data/categories_data.dart';
import 'package:app_receitas/views/components/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vamos Cozinhar?"),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
        ),
        children: categoriesData
            .map(
              (e) => CategoryItem(
                category: e,
              ),
            )
            .toList(),
      ),
    );
  }
}
