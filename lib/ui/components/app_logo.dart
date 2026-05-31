import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  final double tamanhoFonte;
  final Color? cor;

  const LogoApp({super.key, this.tamanhoFonte = 22, this.cor});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.satellite_alt,
          color: cor ?? tema.colorScheme.primary,
          size: tamanhoFonte + 4,
        ),
        const SizedBox(width: 8),
        Text(
          'GeoAlert',
          style: TextStyle(
            fontSize: tamanhoFonte,
            fontWeight: FontWeight.bold,
            color: cor ?? tema.colorScheme.primary,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}