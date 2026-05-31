import 'package:flutter/material.dart';

class TemaApp {
  static const Color _corPrincipal = Color(0xFF1565C0);

  static ThemeData get temaClaro => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _corPrincipal,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      );

  static ThemeData get temaEscuro => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _corPrincipal,
        brightness: Brightness.dark,
      );
}