import 'package:app_receitas/models/utils/routes.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  _criarItens(IconData icon, String label, void Function() funcao) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: funcao,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            color: Theme.of(context).colorScheme.secondary,
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: Text(
              "Vamos cozinhar",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _criarItens(Icons.restaurant, "Refeições", () {
            Navigator.of(context).pushNamed(Routes.home);
          }),
          _criarItens(Icons.settings, "Configurações", () {
            Navigator.of(context).pushNamed(Routes.settings);
          }),
        ],
      ),
    );
  }
}
