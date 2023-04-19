import 'package:projetoa1/Models/Produto.dart';
import 'package:projetoa1/Models/TipoUsuario.dart';

class Usuario {
  late int _id;
  late String _nome;
  late String _email;
  late String _senha;
  late String? _nomeFile;
  late TipoUsuario _tipoUsuario;
  late List<Produto> _carrinho = [];
  static var _count = 0;

  @override
  String toString() {
    return 'Usuario{_id: $_id, _nome: $_nome, _email: $_email, _senha: $_senha, _nomeFile: $_nomeFile, _tipoUsuario: $_tipoUsuario, _carrinho: $_carrinho}';
  }

  Usuario(this._nome, this._email, this._senha, this._nomeFile, this._tipoUsuario){
    this._id = ++_count;
  }

  List<Produto> get carrinho => _carrinho;

  set carrinho(List<Produto> value) {
    _carrinho = value;
  }

  TipoUsuario get tipoUsuario => _tipoUsuario;

  set tipoUsuario(TipoUsuario value) {
    _tipoUsuario = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get email => _email;

  String? get nomeFile => _nomeFile;

  set nomeFile(String? value) {
    _nomeFile = value;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  set email(String value) {
    _email = value;
  }
}