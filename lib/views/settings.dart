import 'package:app_receitas/views/components/main_drawer.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text("Configurações"),
      ),
    );
  }
}
