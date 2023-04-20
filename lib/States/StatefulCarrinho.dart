import 'package:flutter/material.dart';
import 'package:projetoa1/Components/Modelo.dart';
import 'package:projetoa1/Components/ModeloProduto.dart';
import 'package:projetoa1/main.dart';

class StatefulCarrinho extends StatefulWidget {
  const StatefulCarrinho({super.key});

  @override
  State<StatefulWidget> createState() => CarrinhoState();
}

class CarrinhoState extends State<StatefulCarrinho>{
  var p = MyApp.carrinho;

  void rezeta(){
    setState(() {

    });
  }

  List<Widget> metodo(){
    List<Widget> r = [];
    for (int i = 0; i < p.length; i++){
      r.add(ModeloProduto(p[i], rezeta));
    }

    return r;
  }

  void comprar(){
    if (MyApp.usuarioLogado == null){
      Navigator.of(context).pushNamed('telaLogin');
    }
    setState(() {
      MyApp.carrinho = [];
      p = MyApp.carrinho;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Modelo(
      title: "Carrinho",
      floatingActionButton: FloatingActionButton.extended(
        onPressed: comprar,
        label: const Text('Comprar'),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child :  Column(
            children:  metodo(),
          ),
        )
      ),
    );
  }
}