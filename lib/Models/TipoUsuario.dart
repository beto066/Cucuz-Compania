enum TipoUsuario {
  ADMIN(1, "Administrador"), PADRAO(1, "Padrão");

  final int _id;
  final String _descricao;

  const TipoUsuario(this._id, this._descricao);
}