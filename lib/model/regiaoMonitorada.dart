class RegiaoMonitorada {
  final int id;
  final String nome;
  final String pais;
  final String continente;
  final int alertasAtivos;
  final String nivelRisco;

  const RegiaoMonitorada({
    required this.id,
    required this.nome,
    required this.pais,
    required this.continente,
    required this.alertasAtivos,
    required this.nivelRisco,
  });
}
