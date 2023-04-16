import 'package:projetoa1/Models/Categoria.dart';

class Produto {
  late int _id;
  late String _nome;
  late String _descricao;
  late Categoria _categoria;
  late double _preco;
  late String? _nomeFile;
  static var _count = 0;

  Produto(this._nome, this._descricao, this._categoria, this._preco, this._nomeFile) {
    this._id = ++_count;
  }

  @override
  String toString() {
    return 'Produto{_id: $_id, _nome: $_nome, _descricao: $_descricao, _categoria: $_categoria, _preco: $_preco, _nomeFile: $_nomeFile}\n';
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

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