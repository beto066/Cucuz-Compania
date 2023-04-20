import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:projetoa1/Models/Categoria.dart';
import 'package:projetoa1/Models/Produto.dart';
import 'package:projetoa1/Models/TipoUsuario.dart';
import 'package:projetoa1/Models/Usuario.dart';
import 'package:projetoa1/States/StatefulCarrinho.dart';
import 'package:projetoa1/States/StatefulFormProduto.dart';
import 'package:projetoa1/States/StatefulHome.dart';
import 'package:projetoa1/States/StatefulLogin.dart';
import 'package:projetoa1/States/StatefulProduto.dart';
import 'package:crypto/crypto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static Usuario? usuarioLogado;

  static var carrinho = <Produto>[];

  static var usuarios = [
    Usuario('João', 'jao@mail.com', getHash('1234'), null, TipoUsuario.ADMIN),
    Usuario('Se Vamo', 'sevamo@mail.com', getHash('1234'), null, TipoUsuario.PADRAO),
  ];

  static var categorias = [
    Categoria("Arroz"),
    Categoria("Feijão"),
    Categoria("Celular"),
    Categoria("Carro")
  ];

  static var produtos = [
    Produto("Arroz tio jorge 500g", "Pacote de arroz tipo 1 Tio jorge", categorias.elementAt(0), 399.99, null),
    Produto("Feijão São jorge 250g", "Pacote de feijão são jorge", categorias.elementAt(1), 249.99, null),
    Produto("Nokia tijolão", "Celular nokia 95kg resistente a tudo", categorias.elementAt(2), 0.99, null),
    Produto(
        "Uno c/ escada",
        "Fiat uno com escada com 3 infinitos de cilindradas",
        categorias.elementAt(3), 0.49, null
    ),
    Produto("renegade", "jeep renegade com 0.5 cilindradas", categorias.elementAt(3), 5999.99, null)
  ];

  const MyApp({super.key});

  static String getHash(String text){
    var bytesToHash = utf8.encode(text);
    var sha512Digest = sha512.convert(bytesToHash);

    return sha512Digest.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'telaInicial',
      routes: {
        'telaInicial' : (_) => const StatefulHome(),
        'telaProduto' : (context) {
          var parametry = ModalRoute.of(context)!.settings.arguments as Map?;
          return StatefulProduto(idProduto: ((parametry != null) ? parametry['idProduto']: 0));
        },
        'telaCarrinho' : (_) => const StatefulCarrinho(),
        'telaLogin' : (_) => const StatefulLogin(),
        'telaFormProduto' : (context) {
          var parametry = ModalRoute.of(context)!.settings.arguments as Map?;
          return StatefulFormProduto(
            title: ((parametry != null) ? parametry['title']: 'Cadastro de Produtos'),
            produto: ((parametry != null) ? parametry['produto'] : null),
          );
        } ,
      },
    );
  }
}