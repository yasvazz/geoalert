import 'package:flutter/material.dart';
import 'package:geoalert/ui/components/badgeSeveridade.dart';
import 'package:geoalert/ui/components/BarraSuperior.dart';
import '../../model/eventoClimatico.dart';
import '../components/BarraSuperior.dart';
import '../components/badgeSeveridade.dart';

class TelaDetalheEvento extends StatefulWidget {
  final EventoClimatico evento;

  const TelaDetalheEvento({super.key, required this.evento});

  @override
  State<TelaDetalheEvento> createState() => _TelaDetalheEventoState();
}

class _TelaDetalheEventoState extends State<TelaDetalheEvento> {
  bool _estaMonitorando = false;

  void _alternarMonitoramento() {
    setState(() {
      _estaMonitorando = !_estaMonitorando;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _estaMonitorando
              ? '✅ Você está monitorando este evento.'
              : 'Monitoramento removido.',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  IconData _iconeEvento() {
    switch (widget.evento.tipo) {
      case 'Enchente':
        return Icons.water;
      case 'Seca':
        return Icons.wb_sunny;
      case 'Incêndio':
        return Icons.local_fire_department;
      case 'Deslizamento':
        return Icons.landslide;
      case 'Ciclone':
        return Icons.tornado;
      case 'Erosão':
        return Icons.waves;
      case 'Tempestade':
        return Icons.thunderstorm;
      case 'Maré':
        return Icons.tsunami;
      default:
        return Icons.warning_amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final evento = widget.evento;

    return Scaffold(
      appBar: BarraSuperior(
        exibirLogo: false,
        titulo: 'Detalhes do Evento',
        acoes: [
          IconButton(
            icon: Icon(
              _estaMonitorando
                  ? Icons.notifications_active
                  : Icons.notifications_none,
              color: _estaMonitorando ? tema.colorScheme.primary : null,
            ),
            tooltip: _estaMonitorando
                ? 'Parar Monitoramento'
                : 'Monitorar',
            onPressed: _alternarMonitoramento,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: tema.colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            _iconeEvento(),
                            color: tema.colorScheme.primary,
                            size: 32,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                evento.tipo,
                                style: tema.textTheme.labelMedium
                                    ?.copyWith(
                                  color: tema.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                evento.titulo,
                                style: tema.textTheme.titleMedium
                                    ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    BadgeSeveridade(severidade: evento.severidade),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Informações',
                      style: tema.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Divider(height: 20),
                    _LinhaInfo(
                      icone: Icons.location_on,
                      rotulo: 'Região',
                      valor: evento.regiao,
                    ),
                    _LinhaInfo(
                      icone: Icons.schedule,
                      rotulo: 'Detectado em',
                      valor: evento.detectadoEm,
                    ),
                    _LinhaInfo(
                      icone: Icons.satellite_alt,
                      rotulo: 'Fonte Satelital',
                      valor: evento.fonteSatelital,
                    ),
                    _LinhaInfo(
                      icone: Icons.my_location,
                      rotulo: 'Coordenadas',
                      valor:
                          'Lat ${evento.latitude.toStringAsFixed(2)}, '
                          'Lon ${evento.longitude.toStringAsFixed(2)}',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Análise Satelital',
                      style: tema.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      evento.descricao,
                      style: tema.textTheme.bodyMedium?.copyWith(
                        height: 1.6,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _alternarMonitoramento,
                icon: Icon(
                  _estaMonitorando
                      ? Icons.notifications_off
                      : Icons.notifications_active,
                ),
                label: Text(
                  _estaMonitorando
                      ? 'Parar Monitoramento'
                      : 'Monitorar Evento',
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Voltar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LinhaInfo extends StatelessWidget {
  final IconData icone;
  final String rotulo;
  final String valor;

  const _LinhaInfo({
    required this.icone,
    required this.rotulo,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icone, size: 18, color: Colors.grey),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                rotulo,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
              Text(
                valor,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}