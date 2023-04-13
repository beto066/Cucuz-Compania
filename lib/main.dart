import 'package:flutter/material.dart';
import 'package:projetoa1/Models/Categoria.dart';
import 'package:projetoa1/Models/Produto.dart';
import 'package:projetoa1/States/StatefulHome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static var categorias = [
    Categoria("Arroz"),
    Categoria("Feijão"),
    Categoria("Celular"),
    Categoria("Carro")
  ];
  static var produtos = [
    Produto("Arroz tio jorge 500g", "Pacote de arroz tipo 1 Tio jorge", categorias.elementAt(0), 399.99, null),
    Produto("Feijão São jorge 250g", "Pacote de feijão são jorge", categorias.elementAt(1), 249.99, null),
    Produto("Nokia tijolão", "Celular nokia 95kg resistente a tudo", categorias.elementAt(2), 0.99, null),
    Produto(
        "Uno c/ escada",
        "Fiat uno com escada com 3 infinitos de cilindradas",
        categorias.elementAt(3), 0.49, null
    ),
    Produto("renegade", "jeep renegade com 0.5 cilindradas", categorias.elementAt(3), 5999.99, null)
  ];

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StatefulHome(),
    );
  }
}