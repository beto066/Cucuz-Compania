import 'package:flutter/material.dart';
import 'package:projetoa1/Components/Modelo.dart';
import 'package:projetoa1/Models/Produto.dart';
import 'package:projetoa1/main.dart';

class Statefulproduto extends StatefulWidget {
  late int idProduto;

  Statefulproduto({ this.idProduto = 0});

  @override
  State<StatefulWidget> createState() => ProdutoState();
}

class ProdutoState extends State<Statefulproduto>{
  var icon = Icon(Icons.add_shopping_cart);

  void addCarrionho(Produto produto){
    var encontrado = false;

    setState(() {
      for (int i = 0; i < MyApp.carrinho.length && !encontrado; i++){
        if (MyApp.carrinho[i].id == widget.idProduto){
          icon = Icon(Icons.add_shopping_cart);
          MyApp.carrinho.removeAt(i);
          encontrado = true;
        }
      }

      if (!encontrado){
        icon = Icon(Icons.add_shopping_cart);
        MyApp.carrinho.add(produto);
      }

      // print(MyApp.carrinho);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.idProduto == 0){
      Navigator.of(context).pop();
    }

    Produto? produto = null;

    for (var p in MyApp.produtos){
      if (p.id == widget.idProduto) produto = p;
    }

    for (var p in MyApp.carrinho){
      if (p.id == widget.idProduto) icon = Icon(Icons.remove_shopping_cart);
    }

    if (produto == null){
      Navigator.of(context).pop();
    }

    return Modelo(
      principal: true,
      title: 'hello',
      child: SingleChildScrollView(
        child: Container(
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'tag',
                child: Image.asset(
                  'images/defalt_produtos.png',
                  height: 250.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  produto!.nome,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: 8.0),
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
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'R\$${produto.preco.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Center(
                      child : Container(
                        // height: GlobalKey().currentContext!.size!.height/10,
                        child : IconButton(
                          onPressed: () {
                            addCarrionho(produto!);
                          },
                          icon: icon,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Comprar agora'),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

}