enum TipoUsuario {
  ADMIN(1, "Administrador"), PADRAO(2, "Padrão");

  final int id;
  final String descricao;

  const TipoUsuario(this.id, this.descricao);
}