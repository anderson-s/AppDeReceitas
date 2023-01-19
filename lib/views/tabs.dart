import 'package:app_receitas/views/categories_screen.dart';
import 'package:app_receitas/views/components/main_drawer.dart';
import 'package:app_receitas/views/meals_favorite.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int index = 0;
  final pages = [
    {"title": "Lista de Categorias", "page": const CategoriesScreen()},
    {"title": "Favoritos", "page": const MealsFavorite()},
  ];

  _selecionarPagina(int valor) {
    setState(() {
      index = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(pages[index]["title"] as String),
          centerTitle: true,
        ),
        body: pages[index]["page"] as Widget,
        drawer: const MainDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          type: BottomNavigationBarType.shifting,
          currentIndex: index,
          onTap: _selecionarPagina,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(
                Icons.category,
              ),
              label: "Categorias",
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(
                Icons.star,
              ),
              label: "Favoritos",
            )
          ],
        ),
      ),
    );
  }
}
