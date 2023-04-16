import 'package:flutter/material.dart';
import 'package:projetoa1/Components/Modelo.dart';
import 'package:projetoa1/Models/Produto.dart';
import 'package:projetoa1/main.dart';

class StatefulProduto extends StatefulWidget {
  final int idProduto;

  const StatefulProduto({super.key,  this.idProduto = 0});

  @override
  State<StatefulWidget> createState() => ProdutoState();
}

class ProdutoState extends State<StatefulProduto>{
  var icon = const Icon(Icons.add_shopping_cart);

  void addCarrinho(Produto produto){
    var encontrado = false;

    setState(() {
      for (int i = 0; i < MyApp.carrinho.length && !encontrado; i++){
        if (MyApp.carrinho[i].id == widget.idProduto){
          MyApp.carrinho.removeAt(i);
          encontrado = true;
        }
      }

      if (!encontrado){
        MyApp.carrinho.add(produto);
      }
    });
  }

  void rezeta(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.idProduto == 0){
      Navigator.of(context).pop();
    }

    Produto? produto;
    icon = const Icon(Icons.add_shopping_cart);

    for (var p in MyApp.produtos){
      if (p.id == widget.idProduto) produto = p;
    }

    for (var p in MyApp.carrinho){
      if (p.id == widget.idProduto) icon = const Icon(Icons.remove_shopping_cart);
    }

    if (produto == null){
      Navigator.of(context).pop();
    }

    return Modelo(
      principal: true,
      title: 'hello',
      f: rezeta,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'tag',
              child: Image.asset(
                'images/default_produtos.png',
                height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                produto!.nome,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                (produto.descricao != null)? produto.descricao: '',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'R\$${produto.preco.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Center(
                    child : IconButton(
                      onPressed: () {
                        addCarrinho(produto!);
                      },
                      icon: icon,
                      color: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Comprar agora'),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}