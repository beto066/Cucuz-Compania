import 'package:projetoa1/Models/Produto.dart';

class ItemProduto {
  late Produto _produto;
  late int _quantidade;

  Produto get produto => _produto;

  set produto(Produto value) {
    _produto = value;
  }

  int get quantidade => _quantidade;

  set quantidade(int value) {
    _quantidade = value;
  }
}