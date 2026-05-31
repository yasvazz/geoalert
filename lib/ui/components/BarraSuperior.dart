import 'package:flutter/material.dart';
import 'package:geoalert/ui/components/app_logo.dart';
import 'app_logo.dart';

class BarraSuperior extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? acoes;
  final bool exibirLogo;
  final String? titulo;

  const BarraSuperior({
    super.key,
    this.acoes,
    this.exibirLogo = true,
    this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
      title: exibirLogo
          ? const LogoApp()
          : Text(
              titulo ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
      actions: acoes,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}