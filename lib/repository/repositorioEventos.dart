import '../model/eventoClimatico.dart';

const _ev1 = EventoClimatico(
  id: 1,
  titulo: 'Enchente Severa – Vale do Paraíba',
  tipo: 'Enchente',
  regiao: 'Vale do Paraíba, SP',
  descricao:
      'Satélite Sentinel-1 detectou elevação crítica do nível do Rio Paraíba. '
      'Risco de inundação em áreas urbanas nas próximas 12 horas.',
  severidade: Severidade.critico,
  latitude: -22.9,
  longitude: -45.5,
  detectadoEm: '28/05/2026 03:14',
  fonteSatelital: 'Sentinel-1 (ESA)',
);

const _ev2 = EventoClimatico(
  id: 2,
  titulo: 'Seca Extrema – Sertão Nordestino',
  tipo: 'Seca',
  regiao: 'Sertão da Bahia, BA',
  descricao:
      'Imagens MODIS/Terra indicam índice de vegetação (NDVI) em colapso. '
      'Reservatórios abaixo de 10% da capacidade.',
  severidade: Severidade.alto,
  latitude: -10.5,
  longitude: -40.3,
  detectadoEm: '27/05/2026 11:00',
  fonteSatelital: 'MODIS/Terra (NASA)',
);

const _ev3 = EventoClimatico(
  id: 3,
  titulo: 'Queimada – Pantanal',
  tipo: 'Incêndio',
  regiao: 'Pantanal, MT',
  descricao:
      'AQUA/MODIS identificou 243 focos ativos de incêndio. Vento de 40 km/h '
      'aumenta risco de propagação para áreas protegidas.',
  severidade: Severidade.critico,
  latitude: -16.8,
  longitude: -56.9,
  detectadoEm: '28/05/2026 07:45',
  fonteSatelital: 'AQUA/MODIS (NASA)',
);

const _ev4 = EventoClimatico(
  id: 4,
  titulo: 'Deslizamento Iminente – Serra Gaúcha',
  tipo: 'Deslizamento',
  regiao: 'Serra Gaúcha, RS',
  descricao:
      'Radar altimétrico Jason-CS detectou deformação superficial de 3,2 cm '
      'em encosta com histórico de deslizamento. Evacuação preventiva recomendada.',
  severidade: Severidade.alto,
  latitude: -29.2,
  longitude: -51.5,
  detectadoEm: '27/05/2026 22:30',
  fonteSatelital: 'Jason-CS (CNES/NASA)',
);

const _ev5 = EventoClimatico(
  id: 5,
  titulo: 'Ciclone Extratropical – Litoral Sul',
  tipo: 'Ciclone',
  regiao: 'Litoral do RS',
  descricao:
      'GOES-16 rastreia sistema de baixa pressão com ventos de 95 km/h '
      'se aproximando do litoral gaúcho. Previsão de landfall em 8 horas.',
  severidade: Severidade.critico,
  latitude: -31.0,
  longitude: -52.0,
  detectadoEm: '28/05/2026 09:00',
  fonteSatelital: 'GOES-16 (NOAA)',
);

const _ev6 = EventoClimatico(
  id: 6,
  titulo: 'Erosão Costeira – Litoral Nordeste',
  tipo: 'Erosão',
  regiao: 'Litoral do Ceará, CE',
  descricao:
      'Satélite Landsat-9 confirma recuo de 4,7 m de linha costeira em relação '
      'ao último mês. Ondas acima de 3 m previstas para o final de semana.',
  severidade: Severidade.medio,
  latitude: -3.7,
  longitude: -38.5,
  detectadoEm: '26/05/2026 14:20',
  fonteSatelital: 'Landsat-9 (USGS)',
);

const _ev7 = EventoClimatico(
  id: 7,
  titulo: 'Tempestade Elétrica – Centro-Oeste',
  tipo: 'Tempestade',
  regiao: 'Goiás, GO',
  descricao:
      'Sistema convectivo detectado pelo GOES-16 com potencial de granizo '
      'e rajadas de vento acima de 70 km/h. Área afetada: 4 municípios.',
  severidade: Severidade.medio,
  latitude: -15.9,
  longitude: -49.3,
  detectadoEm: '28/05/2026 16:05',
  fonteSatelital: 'GOES-16 (NOAA)',
);

const _ev8 = EventoClimatico(
  id: 8,
  titulo: 'Maré Meteorológica – Baixada Santista',
  tipo: 'Maré',
  regiao: 'Baixada Santista, SP',
  descricao:
      'Dados Jason-3 apontam elevação anômala de 0,8 m acima do nível médio. '
      'Risco de alagamento de orla e áreas portuárias.',
  severidade: Severidade.baixo,
  latitude: -23.9,
  longitude: -46.3,
  detectadoEm: '28/05/2026 05:00',
  fonteSatelital: 'Jason-3 (CNES/NASA)',
);

List<EventoClimatico> getTodosEventos() {
  return const [_ev1, _ev2, _ev3, _ev4, _ev5, _ev6, _ev7, _ev8];
}

List<EventoClimatico> getEventosPorTipo(String tipo) {
  if (tipo == 'Todos') return getTodosEventos();
  return getTodosEventos().where((e) => e.tipo == tipo).toList();
}

List<String> getTodosTipos() {
  final tipos = getTodosEventos().map((e) => e.tipo).toSet().toList();
  tipos.sort();
  return ['Todos', ...tipos];
}