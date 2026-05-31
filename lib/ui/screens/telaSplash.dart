import 'package:flutter/material.dart';
import '../../route.dart';
import '../components/app_logo.dart';

class TelaSplash extends StatefulWidget {
  const TelaSplash({super.key});

  @override
  State<TelaSplash> createState() => _TelaSplashState();
}

class _TelaSplashState extends State<TelaSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController _controlador;
  late Animation<double> _animacaoFade;

  @override
  void initState() {
    super.initState();
    _controlador = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animacaoFade = CurvedAnimation(
      parent: _controlador,
      curve: Curves.easeIn,
    );
    _controlador.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, Rotas.intro);
      }
    });
  }

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return Scaffold(
      backgroundColor: tema.colorScheme.primary,
      body: Center(
        child: FadeTransition(
          opacity: _animacaoFade,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.satellite_alt,
                  size: 64,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              const LogoApp(tamanhoFonte: 30, cor: Colors.white),
              const SizedBox(height: 12),
              Text(
                'Monitoramento de Desastres Climáticos',
                style: tema.textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}