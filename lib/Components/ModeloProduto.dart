import 'package:flutter/material.dart';
import 'package:projetoa1/Models/Produto.dart';

class ModeloProduto extends StatefulWidget {
  late Produto p;
  late Function f;

  ModeloProduto(this.p, this.f);

  @override
  State<StatefulWidget> createState() => ModeloProdutoState();
}

class ModeloProdutoState extends State<ModeloProduto>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 100),
  )..addListener(() {
      setState(() {});
    });

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onTap() {
    setState(() {

    });

    widget.f();

    Navigator.pushNamed(context, 'telaProduto', arguments: {
      'idProduto' : widget.p.id,
    });
    setState(() {
      print('object');

      widget.f();
    });
  }

  @override
  Widget build(BuildContext context) {
    // widget.f();
    _controller.value = 0;
    return GestureDetector(
      onTap: onTap,
      child: Transform.scale(
        scale: 1.0 - _controller.value * 0.5,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    bottomLeft: Radius.circular(16.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage('images/defalt_produtos.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.p.nome,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      widget.p.descricao,
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'R\$${widget.p.preco.toStringAsFixed(2)}',
                      style: TextStyle(
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
        left: borderSide);
  }
}
