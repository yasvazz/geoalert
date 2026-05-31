import 'package:flutter/material.dart';
import '../../model/eventoClimatico.dart';
import 'BadgeSeveridade.dart';


class CardEvento extends StatelessWidget {
  final EventoClimatico evento;
  final VoidCallback? aoTocar;

  const CardEvento({super.key, required this.evento, this.aoTocar});

  IconData _iconeEvento() {
    switch (evento.tipo) {
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
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: aoTocar,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: tema.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  _iconeEvento(),
                  color: tema.colorScheme.primary,
                  size: 26,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      evento.titulo,
                      style: tema.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 13,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 2),
                        Expanded(
                          child: Text(
                            evento.regiao,
                            style: tema.textTheme.bodySmall
                                ?.copyWith(color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        BadgeSeveridade(severidade: evento.severidade),
                        const Spacer(),
                        Text(
                          evento.detectadoEm,
                          style: tema.textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}