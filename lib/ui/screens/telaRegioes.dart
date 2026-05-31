import 'package:flutter/material.dart';
import 'package:geoalert/ui/components/BarraSuperior.dart';
import '../../model/regiaoMonitorada.dart';
import '../../repository/repositorioRegioes.dart';
import '../components/BarraSuperior.dart';
import '../components/cardRegiao.dart';

class TelaRegioes extends StatefulWidget {
  const TelaRegioes({super.key});

  @override
  State<TelaRegioes> createState() => _TelaRegioesState();
}

class _TelaRegioesState extends State<TelaRegioes> {
  String _continenteSelecionado = 'Todos';
  List<RegiaoMonitorada> _regioesFiltradas = getTodasRegioes();

  void _aplicarFiltro(String continente) {
    setState(() {
      _continenteSelecionado = continente;
      _regioesFiltradas = getRegioesPorContinente(continente);
    });
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final continentes = getTodosContinentes();

    return Scaffold(
      appBar: BarraSuperior(
        exibirLogo: false,
        titulo: 'Regiões Monitoradas',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: tema.colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: tema.colorScheme.secondary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Dados obtidos via satélites Sentinel, MODIS, Jason-CS e GOES-16.',
                    style: tema.textTheme.bodySmall?.copyWith(
                      color: tema.colorScheme.onSecondaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              itemCount: continentes.length,
              itemBuilder: (context, indice) {
                final continente = continentes[indice];
                final estaSelecionado = continente == _continenteSelecionado;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(continente),
                    selected: estaSelecionado,
                    onSelected: (_) => _aplicarFiltro(continente),
                    selectedColor: tema.colorScheme.secondaryContainer,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            child: Text(
              '${_regioesFiltradas.length} região(ões) encontrada(s)',
              style: tema.textTheme.bodySmall
                  ?.copyWith(color: Colors.grey),
            ),
          ),
          Expanded(
            child: _regioesFiltradas.isEmpty
                ? const Center(
                    child: Text(
                      'Nenhuma região encontrada.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 16),
                    itemCount: _regioesFiltradas.length,
                    itemBuilder: (context, indice) {
                      final regiao = _regioesFiltradas[indice];
                      return CardRegiao(regiao: regiao);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}