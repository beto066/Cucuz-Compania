import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projetoa1/Components/Modelo.dart';
import 'package:projetoa1/Models/Categoria.dart';
import 'package:projetoa1/main.dart';
import 'package:select_form_field/select_form_field.dart';

import '../Models/Produto.dart';

class StatefulFormProduto extends StatefulWidget {
  final String? title;
  final Produto? produto;


  const StatefulFormProduto({super.key, this.title, this.produto});

  @override
  State<StatefulWidget> createState() => FormProdutoState();
}

class FormProdutoState extends State<StatefulFormProduto> {
  final GlobalKey<FormState> _chave = GlobalKey<FormState>();

  final TextEditingController _nome = TextEditingController();
  final TextEditingController _descricao = TextEditingController();
  final TextEditingController _categoria = TextEditingController();
  final TextEditingController _preco = TextEditingController();

  var categorias = <Map<String, dynamic>>[];

  void salvar() {
    setState(() {
      if (_chave.currentState!.validate()){
        Categoria categoria = MyApp.categorias[0];
        for (int i = 0; i < MyApp.categorias.length; i++){
          if (MyApp.categorias[i].categoria == _categoria.text){
            categoria = MyApp.categorias[i];
          }
        }

        MyApp.produtos.add(Produto(_nome.text, _descricao.text, categoria, double.parse(_preco.text), ''));

        Navigator.of(context).pop();
      }
    });
  }

  void cancelar() {
    Navigator.of(context).pop();
  }

  void getCategoria(String value) {
    var encontrado = false;

    for (int i = 0; i < categorias.length && !encontrado; i++){
      if (categorias[i]['label'] == value){
        _categoria.text = categorias[i]['value'];
        encontrado = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    for (int i = 0; i < MyApp.categorias.length; i++){
      categorias.add({
        'value' : MyApp.categorias[i].categoria,
        'label': MyApp.categorias[i].categoria
      });
    }

    return Modelo(
      title: (widget.title != null)? widget.title! : 'Cadastro de Produtos',
      child: SingleChildScrollView(
        child: Form(
          key: _chave,
          child : Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _nome,
                  decoration: const InputDecoration(
                      hintText: 'Entre com o nome do produto'
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Ta ficando doido??";
                    }
                    if (value.length < 2){
                      return 'Insira um nome válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _descricao,
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: 'Entre com a descrição do produto'
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Digita ai na moral";
                    }
                    if (value.length < 2){
                      return 'Insira uma descrição válida';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                SelectFormField(
                  controller: _categoria,
                  type: SelectFormFieldType.dropdown,
                  labelText: 'Selecione a categoria do produto',
                  validator: (value) {
                    if (value ==null || value.isEmpty){
                      return 'Este campo não pode ser nulo';
                    }
                    return null;
                  },
                  items: categorias,
                  initialValue: ((widget.produto != null) ? widget.produto!.categoria.categoria : null),
                  onChanged: (value) {
                    getCategoria(value);
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'(^\d*\.?\d*)'))
                  ],
                  keyboardType: TextInputType.number,
                  controller: _preco,
                  decoration:
                  const InputDecoration(hintText: 'Informe o preço do produto'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Ta ficando doido??";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: salvar,
                        child: const Text("Salvar"),
                      ),
                      const SizedBox(width: 7.0),
                      ElevatedButton(
                        onPressed: cancelar,
                        child: const Text("Cancelar"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100.0),
              ]
            )
          ),
        ),
      ),
    );
  }
}