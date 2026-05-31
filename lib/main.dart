import 'package:flutter/material.dart';
import 'package:geoalert/model/eventoClimatico.dart';
import 'route.dart';
import 'ui/temaAPP.dart';
import 'ui/screens/telaSplash.dart';
import 'ui/screens/telaIntro.dart';
import 'ui/screens/telaInicio.dart';
import 'ui/screens/telaAlerta.dart';
import 'ui/screens/telaRegioes.dart';
import 'ui/screens/telaDetalheEvento.dart';
import 'model/eventoClimatico.dart';

void main() {
  runApp(const GeoAlertApp());
}

class GeoAlertApp extends StatelessWidget {
  const GeoAlertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GeoAlert',
      debugShowCheckedModeBanner: false,
      theme: TemaApp.temaClaro,
      darkTheme: TemaApp.temaEscuro,
      themeMode: ThemeMode.system,
      initialRoute: Rotas.splash,
      onGenerateRoute: (configuracao) {
        switch (configuracao.name) {
          case Rotas.splash:
            return MaterialPageRoute(
              builder: (_) => const TelaSplash(),
            );
          case Rotas.intro:
            return MaterialPageRoute(
              builder: (_) => const TelaIntro(),
            );
          case Rotas.inicio:
            return MaterialPageRoute(
              builder: (_) => const TelaInicio(),
            );
          case Rotas.alertas:
            return MaterialPageRoute(
              builder: (_) => const TelaAlertas(),
            );
          case Rotas.regioes:
            return MaterialPageRoute(
              builder: (_) => const TelaRegioes(),
            );
          case Rotas.detalhe:
            final evento = configuracao.arguments as EventoClimatico;
            return MaterialPageRoute(
              builder: (_) => TelaDetalheEvento(evento: evento),
            );
          default:
            return MaterialPageRoute(
              builder: (_) => const TelaSplash(),
            );
        }
      },
    );
  }
}