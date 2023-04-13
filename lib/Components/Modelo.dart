import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Modelo extends StatefulWidget {
  const Modelo({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  State<Modelo> createState() => _ModeloState();
}

class _ModeloState extends State<Modelo> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: widget.child
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}