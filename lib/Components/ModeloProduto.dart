import 'package:flutter/material.dart';
import 'package:projetoa1/Models/Produto.dart';

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

  @override
  Widget build(BuildContext context) {
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
                children: [
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
                ],
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
