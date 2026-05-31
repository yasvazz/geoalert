import 'package:flutter/material.dart';
import 'package:geoalert/ui/components/BarraSuperior.dart';
import '../../route.dart';
import '../../repository/repositorioEventos.dart';
import '../components/BarraSuperior.dart';
import '../components/cardEstatistica.dart';
import '../components/cardEvento.dart';

class TelaInicio extends StatelessWidget {
  const TelaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final eventosRecentes = getTodosEventos().take(3).toList();
    final totalCriticos = getTodosEventos()
        .where((e) => e.severidade.index >= 2)
        .length;

    return Scaffold(
      appBar: BarraSuperior(
        acoes: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            tooltip: 'Notificações',
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    tema.colorScheme.primary,
                    tema.colorScheme.tertiary,
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GeoAlert',
                    style: tema.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Monitoramento Climático via Satélite',
                    style: tema.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white70),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '28/05/2026 · Última atualização: 09:00',
                    style: tema.textTheme.bodySmall
                        ?.copyWith(color: Colors.white60),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Resumo',
              style: tema.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: CardEstatistica(
                    rotulo: 'Eventos Ativos',
                    valor: '${getTodosEventos().length}',
                    icone: Icons.warning_amber,
                    cor: const Color(0xFFE53935),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CardEstatistica(
                    rotulo: 'Críticos',
                    valor: '$totalCriticos',
                    icone: Icons.crisis_alert,
                    cor: const Color(0xFF6A1B9A),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Módulos',
              style: tema.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _BotaoNavegacao(
                    icone: Icons.warning_amber_rounded,
                    rotulo: 'Alertas',
                    cor: const Color(0xFFE53935),
                    aoTocar: () =>
                        Navigator.pushNamed(context, Rotas.alertas),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _BotaoNavegacao(
                    icone: Icons.public,
                    rotulo: 'Regiões',
                    cor: const Color(0xFF1565C0),
                    aoTocar: () =>
                        Navigator.pushNamed(context, Rotas.regioes),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Alertas Recentes',
                  style: tema.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, Rotas.alertas),
                  child: const Text('Ver todos'),
                ),
              ],
            ),
            const SizedBox(height: 4),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: eventosRecentes.length,
              itemBuilder: (context, indice) {
                final evento = eventosRecentes[indice];
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
          ],
        ),
      ),
    );
  }
}

class _BotaoNavegacao extends StatelessWidget {
  final IconData icone;
  final String rotulo;
  final Color cor;
  final VoidCallback aoTocar;

  const _BotaoNavegacao({
    required this.icone,
    required this.rotulo,
    required this.cor,
    required this.aoTocar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: aoTocar,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Column(
            children: [
              Icon(icone, color: cor, size: 32),
              const SizedBox(height: 6),
              Text(
                rotulo,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}