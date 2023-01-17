import 'package:app_receitas/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = ThemeData();
    return MaterialApp(
      title: "Receitas",
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.blue,
          // secondary: Colors.amber,
        ),
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
