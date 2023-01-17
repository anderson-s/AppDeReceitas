import 'package:app_receitas/views/categories_screen.dart';
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
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
         appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            // fontWeight: FontWeight.bold,
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Vamos Cozinhar?"),
          centerTitle: true,
        ),
        body: const CategoriesScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
