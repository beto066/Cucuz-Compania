import 'package:flutter/cupertino.dart';
import 'package:projetoa1/Components/Modelo.dart';
import 'package:projetoa1/Components/ModeloProduto.dart';
import 'package:projetoa1/main.dart';

class StatefulHome extends StatefulWidget {
  const StatefulHome({super.key});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<StatefulHome> {
  var p = MyApp.produtos;

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

  @override
  Widget build(BuildContext context) {
    return Modelo(
      title: "Cuscuz e compania",
      f: rezeta,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child : Column(
            children: metodo(),
          ),
        )
      ),
    );
  }
}
