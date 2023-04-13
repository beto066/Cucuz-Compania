import 'package:flutter/cupertino.dart';
import 'package:projetoa1/Components/Modelo.dart';
import 'package:projetoa1/Components/ModeloProduto.dart';
import 'package:projetoa1/Models/Produto.dart';
import 'package:projetoa1/main.dart';

class StatefulHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<StatefulHome> {
  var p = MyApp.produtos;


  List<Widget> metodo(){
    List<Widget> r = [];
    for (int i = 0; i < p.length; i++){
      r.add(ModeloProduto(p[i]));
    }

    return r;
  }

  @override
  Widget build(BuildContext context) {
    return Modelo(
        title: "Cuscuz e compania",
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child : Column(
              children: metodo(),
              // children: [
              //   ModeloProduto(p[0]),
              //   ModeloProduto(p[1]),
              //   ModeloProduto(p[2]),
              //   ModeloProduto(p[3]),
              //   ModeloProduto(p[4]),
              // ],
            ),
          )
        )
    );
  }
}
