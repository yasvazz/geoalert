import 'package:flutter/material.dart';
import 'package:geoalert/ui/components/BarraSuperior.dart';
import '../../model/eventoClimatico.dart';
import '../../repository/repositorioEventos.dart';
import '../../route.dart';
import '../components/cardEvento.dart';
import '../components/BarraSuperior.dart';

class TelaAlertas extends StatefulWidget {
  const TelaAlertas({super.key});

  @override
  State<TelaAlertas> createState() => _TelaAlertasState();
}

class _TelaAlertasState extends State<TelaAlertas> {
  String _tipoSelecionado = 'Todos';
  List<EventoClimatico> _eventosFiltrados = getTodosEventos();

  void _aplicarFiltro(String tipo) {
    setState(() {
      _tipoSelecionado = tipo;
      _eventosFiltrados = getEventosPorTipo(tipo);
    });
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final tipos = getTodosTipos();

    return Scaffold(
      appBar: BarraSuperior(
        exibirLogo: false,
        titulo: 'Alertas Climáticos',
        acoes: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Atualizar',
            onPressed: () => _aplicarFiltro(_tipoSelecionado),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              itemCount: tipos.length,
              itemBuilder: (context, indice) {
                final tipo = tipos[indice];
                final estaSelecionado = tipo == _tipoSelecionado;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(tipo),
                    selected: estaSelecionado,
                    onSelected: (_) => _aplicarFiltro(tipo),
                    selectedColor: tema.colorScheme.primaryContainer,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            child: Text(
              '${_eventosFiltrados.length} evento(s) encontrado(s)',
              style: tema.textTheme.bodySmall
                  ?.copyWith(color: Colors.grey),
            ),
          ),
          Expanded(
            child: _eventosFiltrados.isEmpty
                ? const Center(
                    child: Text(
                      'Nenhum evento encontrado\npara este filtro.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 16),
                    itemCount: _eventosFiltrados.length,
                    itemBuilder: (context, indice) {
                      final evento = _eventosFiltrados[indice];
                      return CardEvento(
                        evento: evento,
                        aoTocar: () => Navigator.pushNamed(
                          context,
                          Rotas.detalhe,
                          arguments: evento,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}