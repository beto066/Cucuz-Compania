import 'package:flutter/material.dart';
import 'package:projetoa1/Components/FloatingActionButtonCarrinho.dart';
import 'package:projetoa1/Models/Usuario.dart';
import 'package:projetoa1/main.dart';

class Modelo extends StatefulWidget {
  const Modelo({super.key, required this.title, required this.child, this.principal = false, this.floatingActionButton, this.f });

  final String title;
  final Widget child;
  final bool principal;
  final Widget? floatingActionButton;
  final Function? f;

  @override
  State<Modelo> createState() => _ModeloState();
}

class _ModeloState extends State<Modelo> {
  void rezeta(){
    if (widget.f != null){
      widget.f!();
    } else {
      setState(() {
      });
    }
  }

  void logar(){
    if (widget.f != null){
      widget.f!();
    } else {
      setState(() {
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    var listView = <Widget>[];

    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    scaffoldKey.currentState?.closeDrawer();

    if (MyApp.usuarioLogado != null){
      listView.add(
        UserAccountsDrawerHeader(
          accountName: Text(MyApp.usuarioLogado!.nome),
          accountEmail: Text(MyApp.usuarioLogado!.email),
          currentAccountPicture: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.grey),
          ),
        ),
      );

      listView.add(
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.popAndPushNamed(context, 'telaInicial').then((value) => {
              if (widget.f != null){
                widget.f!()
              }
            });
          },
        ),
      );

      listView.add(
        ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: const Text('Carrinho'),
          onTap: (){
            Navigator.popAndPushNamed(context, 'telaCarrinho').then((value) => {
              if (widget.f != null){
                widget.f!()
              }
            });
          },
        )
      );

      print(MyApp.usuarioLogado!.tipoUsuario.id);

      if (MyApp.usuarioLogado!.tipoUsuario.id == 1){
        listView.add(
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Cadastrar Produto'),
            onTap: (){
              Navigator.popAndPushNamed(context, 'telaFormProduto').then((value) => {
                if (widget.f != null){
                  widget.f!()
                }
              });
            },
          )
        );
      }

      listView.add(
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            MyApp.usuarioLogado = null;
            if (widget.f != null){
              widget.f!();
            }
          },
        ),
      );
    } else {
      listView.add(
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.popAndPushNamed(context, 'telaInicial').then((value) => {
              if (widget.f != null){
                widget.f!()
              }
            });
          },
        ),
      );

      listView.add(
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Carrinho'),
            onTap: (){
              Navigator.popAndPushNamed(context, 'telaCarrinho').then((value) => {
                if (widget.f != null){
                  widget.f!()
                }
              });
            },
          )
      );

      listView.add(
        ListTile(
          leading: const Icon(Icons.login),
          title: const Text('Login'),
          onTap: () {
            Navigator.popAndPushNamed(context, 'telaLogin').then((value) => {
              if (widget.f != null){
                widget.f!()
              }
            });
          },
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        child: ListView(
          children: listView,
        ),
      ),
      body: Center(
        child: widget.child
      ),
      floatingActionButton: (widget.floatingActionButton == null)? FloatingActionButtonCarrinho(f: rezeta,) : widget.floatingActionButton,
    );
  }
}