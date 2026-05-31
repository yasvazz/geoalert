import 'package:flutter/material.dart';
import '../../model/eventoClimatico.dart';

class BadgeSeveridade extends StatelessWidget {
  final Severidade severidade;

  const BadgeSeveridade({super.key, required this.severidade});

  Color _corBadge() {
    switch (severidade) {
      case Severidade.baixo:
        return const Color(0xFF43A047);
      case Severidade.medio:
        return const Color(0xFFFB8C00);
      case Severidade.alto:
        return const Color(0xFFE53935);
      case Severidade.critico:
        return const Color(0xFF6A1B9A);
    }
  }

  String _rotuloBadge() {
    switch (severidade) {
      case Severidade.baixo:
        return 'Baixo';
      case Severidade.medio:
        return 'Médio';
      case Severidade.alto:
        return 'Alto';
      case Severidade.critico:
        return 'Crítico';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _corBadge(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        _rotuloBadge(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}