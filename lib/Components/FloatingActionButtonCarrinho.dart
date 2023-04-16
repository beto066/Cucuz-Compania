import 'package:flutter/material.dart';
import 'package:projetoa1/main.dart';

class FloatingActionButtonCarrinho extends StatefulWidget {
  final Function f;

  const FloatingActionButtonCarrinho({super.key, required this.f });

  @override
  State<StatefulWidget> createState() => FloatingActionCarrinhoState();
}

class FloatingActionCarrinhoState extends State<FloatingActionButtonCarrinho>{
  void toCarrinho(){
    Navigator.pushNamed(context, 'telaCarrinho').then((value) {
      widget.f();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        toCarrinho();
      },
      icon: const Icon(Icons.shopping_cart),
      label: Text('${MyApp.carrinho.length}'),
    );
  }
}