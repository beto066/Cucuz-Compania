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

  Produto? produto;

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

  void editarProduto() {
    Navigator.pushNamed(context, 'telaFormProduto', arguments: {
      'title' : 'Editar Produto',
      'produto' : produto
    });
  }

  void removerProduto() {
    removeProdutoList(MyApp.produtos, produto!);
    removeProdutoList(MyApp.carrinho, produto!);
    Navigator.of(context).pop();
  }

  void comprar(){
    if (MyApp.usuarioLogado == null){
      Navigator.of(context).pushNamed('telaLogin');
    }

    setState(() {
      MyApp.carrinho = [];
    });
  }

  void rezeta(){
    setState(() {

    });
  }

  void removeProdutoList(List<Produto> l, Produto p){
    var encontrado = false;
    for (var i = 0; i < MyApp.produtos.length && !encontrado; i++){
      if (p.id == MyApp.produtos[i].id){
        MyApp.produtos.removeAt(i);
        encontrado = true;
      }
    }
  }

  Produto? encontraProduto(List<Produto> l){
    var encontrado = false;
    var p;
    for (var i = 0; i < l.length && !encontrado; i++){
      if (l[i].id == widget.idProduto) {
        p = l[i];
        encontrado = true;
      }
    }

    return p;
  }

  @override
  Widget build(BuildContext context) {
    icon = const Icon(Icons.add_shopping_cart);

    var row = <Widget>[];

    if (widget.idProduto < 1){
      Navigator.of(context).pop();
    }

    produto = encontraProduto(MyApp.produtos);

    if (encontraProduto(MyApp.carrinho) != null){
      icon = Icon(Icons.remove_shopping_cart);
    }

    if (produto == null){
      Navigator.of(context).pop();
    }

    row.add(
      Text(
        'R\$${produto!.preco.toStringAsFixed(2)}',
        style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
      ),
    );

    if (MyApp.usuarioLogado != null && MyApp.usuarioLogado!.tipoUsuario.id == 1){
      row.add(const SizedBox(width: 5.0));

      row.add(
        IconButton(
          onPressed: editarProduto,
          icon: const Icon(Icons.edit),
          color: Colors.green,
        )
      );

      row.add(const SizedBox(width: 5.0));

      row.add(
        IconButton(
          onPressed: removerProduto,
          icon: const Icon(Icons.remove),
          color: Colors.red,
        )
      );
    }

    return Modelo(
      principal: true,
      title: 'hello',
      f: rezeta,
      child: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
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
                child: Row(
                  children: [
                    Text(
                      produto!.nome,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),

                    const SizedBox(width: 10.0),
                    Text(
                      produto!.categoria.categoria,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  (produto!.descricao != null)? produto!.descricao: '',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: row,
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        addCarrinho(produto!);
                      },
                      icon: icon,
                      color: Colors.black,
                    ),

                    const SizedBox(height: 5.0),
                    ElevatedButton(
                      onPressed: comprar,
                      child: const Text('Comprar agora'),
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