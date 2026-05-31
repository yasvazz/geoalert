import '../model/regiaoMonitorada.dart';

const _rg1 = RegiaoMonitorada(
  id: 1,
  nome: 'Vale do Paraíba',
  pais: 'Brasil',
  continente: 'América do Sul',
  alertasAtivos: 3,
  nivelRisco: 'Crítico',
);

const _rg2 = RegiaoMonitorada(
  id: 2,
  nome: 'Sertão Nordestino',
  pais: 'Brasil',
  continente: 'América do Sul',
  alertasAtivos: 2,
  nivelRisco: 'Alto',
);

const _rg3 = RegiaoMonitorada(
  id: 3,
  nome: 'Pantanal',
  pais: 'Brasil',
  continente: 'América do Sul',
  alertasAtivos: 5,
  nivelRisco: 'Crítico',
);

const _rg4 = RegiaoMonitorada(
  id: 4,
  nome: 'Serra Gaúcha',
  pais: 'Brasil',
  continente: 'América do Sul',
  alertasAtivos: 1,
  nivelRisco: 'Alto',
);

const _rg5 = RegiaoMonitorada(
  id: 5,
  nome: 'Litoral do RS',
  pais: 'Brasil',
  continente: 'América do Sul',
  alertasAtivos: 4,
  nivelRisco: 'Crítico',
);

const _rg6 = RegiaoMonitorada(
  id: 6,
  nome: 'Bacia Amazônica',
  pais: 'Brasil',
  continente: 'América do Sul',
  alertasAtivos: 2,
  nivelRisco: 'Médio',
);

const _rg7 = RegiaoMonitorada(
  id: 7,
  nome: 'Sahel',
  pais: 'Mali',
  continente: 'África',
  alertasAtivos: 1,
  nivelRisco: 'Alto',
);

const _rg8 = RegiaoMonitorada(
  id: 8,
  nome: 'Filipinas',
  pais: 'Filipinas',
  continente: 'Ásia',
  alertasAtivos: 6,
  nivelRisco: 'Crítico',
);

const _rg9 = RegiaoMonitorada(
  id: 9,
  nome: 'Delta de Bangladesh',
  pais: 'Bangladesh',
  continente: 'Ásia',
  alertasAtivos: 3,
  nivelRisco: 'Alto',
);

const _rg10 = RegiaoMonitorada(
  id: 10,
  nome: 'Califórnia',
  pais: 'EUA',
  continente: 'América do Norte',
  alertasAtivos: 2,
  nivelRisco: 'Médio',
);

List<RegiaoMonitorada> getTodasRegioes() {
  return const [_rg1, _rg2, _rg3, _rg4, _rg5, _rg6, _rg7, _rg8, _rg9, _rg10];
}

List<RegiaoMonitorada> getRegioesPorContinente(String continente) {
  if (continente == 'Todos') return getTodasRegioes();
  return getTodasRegioes().where((r) => r.continente == continente).toList();
}

List<String> getTodosContinentes() {
  final continentes = getTodasRegioes().map((r) => r.continente).toSet().toList();
  continentes.sort();
  return ['Todos', ...continentes];
}