import 'package:flutter/material.dart';
import 'package:projetoa1/Models/Produto.dart';
import 'package:projetoa1/main.dart';

class ModeloProduto extends StatefulWidget {
  final Produto p;
  final Function f;

  const ModeloProduto(this.p, this.f, {super.key});

  @override
  State<StatefulWidget> createState() => ModeloProdutoState();
}

class ModeloProdutoState extends State<ModeloProduto>{
  void onTap() {
    setState(() {

    });

    Navigator.pushNamed(context, 'telaProduto', arguments: {
      'idProduto' : widget.p.id,
    }).then((value) {widget.f();});
  }

  void editarProduto() {
    Navigator.pushNamed(context, 'telaFormProduto', arguments: {
      'title' : 'Editar Produto',
      'produto' : widget.p
    });
  }

  void removerProduto() {
    setState(() {
      removeProdutoList(MyApp.produtos, widget.p);
      removeProdutoList(MyApp.carrinho, widget.p);
      widget.f();
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

  @override
  Widget build(BuildContext context) {

    var detalhesProduto = [
      Text(
        widget.p.nome,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 8.0),
      Text(
        widget.p.descricao,
        style: const TextStyle(fontSize: 14.0),
      ),

      const SizedBox(height: 8.0),
      Text(
        'R\$${widget.p.preco.toStringAsFixed(2)}',
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    ];

    if (MyApp.usuarioLogado != null && MyApp.usuarioLogado!.tipoUsuario.id == 1) {
      detalhesProduto.add(const SizedBox(height: 5.0));
      detalhesProduto.add(
        Row(
          children: [
            ElevatedButton(
              onPressed: editarProduto,
              child: const Text('Editar'),
            ),
            const SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: removerProduto,
              child: const Text('Remover')
            ),
          ],
        )
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                ),
                image: DecorationImage(
                  image: AssetImage('images/default_produtos.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: detalhesProduto
              ),
            ),
          ],
        ),
      ),
    );
  }

  Border borderAll(double size) {
    var borderSide = BorderSide(
      width: size,
    );
    return Border(
      top: borderSide,
      right: borderSide,
      bottom: borderSide,
      left: borderSide
    );
  }
}
