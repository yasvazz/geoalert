enum Severidade { baixo, medio, alto, critico }

class EventoClimatico {
  final int id;
  final String titulo;
  final String tipo;
  final String regiao;
  final String descricao;
  final Severidade severidade;
  final double latitude;
  final double longitude;
  final String detectadoEm;
  final String fonteSatelital;

  const EventoClimatico({
    required this.id,
    required this.titulo,
    required this.tipo,
    required this.regiao,
    required this.descricao,
    required this.severidade,
    required this.latitude,
    required this.longitude,
    required this.detectadoEm,
    required this.fonteSatelital,
  });
}