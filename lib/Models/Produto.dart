import 'package:projetoa1/Models/Categoria.dart';

class Produto {
  late String _nome;
  late String _descricao;
  late Categoria _categoria;
  late double _preco;
  late String? _nomeFile;

  Produto(this._nome, this._descricao, this._categoria, this._preco, this._nomeFile);

  double get preco => _preco;

  set preco(double value) {
    _preco = value;
  }

  String? get nomeFile => _nomeFile;

  set nomeFile(String? value) {
    _nomeFile = value;
  }

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  Categoria get categoria => _categoria;

  set categoria(Categoria value) {
    _categoria = value;
  }
}