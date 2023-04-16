import 'package:flutter/material.dart';
import 'package:projetoa1/main.dart';

class Modelo extends StatefulWidget {
  const Modelo({super.key, required this.title, required this.child, this.principal = false});

  final String title;
  final Widget child;
  final bool principal;

  @override
  State<Modelo> createState() => _ModeloState();
}

class _ModeloState extends State<Modelo> {

  @override
  Widget build(BuildContext context) {
    print('${MyApp.carrinho.length}');
    return Scaffold(
      appBar: AppBar(
        leading: (!widget.principal)? null :
         IconButton(
          icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop('arroz');
            },
          ),
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: widget.child
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        tooltip: 'Increment',
        icon: const Icon(Icons.shopping_cart),
        label: Text('${MyApp.carrinho.length}'),
      ),
    );
  }
}