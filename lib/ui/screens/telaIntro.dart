import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../route.dart';
import '../components/app_logo.dart';

class _PaginaIntro {
  final String lottie;
  final String titulo;
  final String descricao;
  const _PaginaIntro({
    required this.lottie,
    required this.titulo,
    required this.descricao,
  });
}

class TelaIntro extends StatefulWidget {
  const TelaIntro({super.key});

  @override
  State<TelaIntro> createState() => _TelaIntroState();
}

class _TelaIntroState extends State<TelaIntro> {
  final PageController _controladorPagina = PageController();
  int _paginaAtual = 0;

  final List<_PaginaIntro> _paginas = const [
    _PaginaIntro(
      lottie: 'assets/lottie/satelite.json',
      titulo: 'Monitoramento Espacial',
      descricao:
          'O GeoAlert utiliza dados de satélites como GOES-16, Sentinel-1 e '
          'Jason-CS para detectar riscos climáticos em tempo real em todo o planeta.',
    ),
    _PaginaIntro(
      lottie: 'assets/lottie/alerta.json',
      titulo: 'Alertas Antecipados',
      descricao:
          'Receba alertas de enchentes, deslizamentos, ciclones, secas e incêndios '
          'antes que causem danos. Nossa IA analisa dados orbitais continuamente.',
    ),
    _PaginaIntro(
      lottie: 'assets/lottie/regioes.json',
      titulo: 'Regiões Globais',
      descricao:
          'Monitore regiões de risco no mundo todo. Filtre por continente, '
          'tipo de evento e nível de severidade para decisões mais rápidas.',
    ),
  ];

  @override
  void dispose() {
    _controladorPagina.dispose();
    super.dispose();
  }

  void _proximaPagina() {
    if (_paginaAtual < _paginas.length - 1) {
      _controladorPagina.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, Rotas.inicio);
    }
  }

  void _paginaAnterior() {
    if (_paginaAtual > 0) {
      _controladorPagina.previousPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final ehUltima = _paginaAtual == _paginas.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LogoApp(),
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      Rotas.inicio,
                    ),
                    child: const Text('Pular'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controladorPagina,
                itemCount: _paginas.length,
                onPageChanged: (indice) {
                  setState(() => _paginaAtual = indice);
                },
                itemBuilder: (context, indice) {
                  final pagina = _paginas[indice];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          pagina.lottie,
                          width: 200,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 40),
                        Text(
                          pagina.titulo,
                          style: tema.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          pagina.descricao,
                          style: tema.textTheme.bodyLarge?.copyWith(
                            color: Colors.grey[600],
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _paginas.length,
                (indice) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _paginaAtual == indice ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _paginaAtual == indice
                        ? tema.colorScheme.primary
                        : tema.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  if (_paginaAtual > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _paginaAnterior,
                        child: const Text('Voltar'),
                      ),
                    ),
                  if (_paginaAtual > 0) const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: FilledButton(
                      onPressed: _proximaPagina,
                      child: Text(ehUltima ? 'Começar' : 'Avançar'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}