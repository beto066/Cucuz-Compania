class Categoria {
  late int _id;
  late String _categoria;
  static var _count = 0;

  Categoria(this._categoria){
    this._id = ++_count;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get categoria => _categoria;

  set categoria(String value) {
    _categoria = value;
  }
}