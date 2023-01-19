import 'package:app_receitas/models/filters.dart';
import 'package:app_receitas/views/components/main_drawer.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  final Function(Filtres) filtros;
  const Settings({super.key, required this.filtros});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var filtros = Filtres();

  Widget _criarSwitch(
      String title, String subitile, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.filtros(filtros);
      },
      title: Text(title),
      subtitle: Text(subitile),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Configurações",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _criarSwitch("Sem Glúten", "Só exibe refeições sem glúten!",
                  filtros.isGlutenFree, (value) {
                setState(() {
                  filtros.isGlutenFree = value;
                });
              }),
              _criarSwitch("Sem Lactose", "Só exibe refeições sem lactose!",
                  filtros.isLactoseFree, (value) {
                setState(() {
                  filtros.isLactoseFree = value;
                });
              }),
              _criarSwitch(
                  "Vegana", "Só exibe refeições veganas!", filtros.isVegan,
                  (value) {
                setState(() {
                  filtros.isVegan = value;
                });
              }),
              _criarSwitch("Vegetariana", "Só exibe refeições vegetarianas!",
                  filtros.isVegetarian, (value) {
                setState(() {
                  filtros.isVegetarian = value;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
