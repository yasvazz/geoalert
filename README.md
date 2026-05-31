GeoAlert — Monitoramento de Desastres Climáticos via SatéliteGlobal Solution 2026.1 — Desenvolvimento Cross Platform com Flutter
Professor: Heider Pinholi Lopes | Turmas: 3SIS

Sobre o Projeto
O GeoAlert nasceu de uma pergunta simples: e se pudéssemos saber que um desastre está chegando antes que ele aconteça?
Utilizando dados reais de satélites como GOES-16, Sentinel-1, Jason-CS e MODIS/Terra, o app monitora eventos climáticos ao redor do mundo e emite alertas classificados por severidade — ajudando populações e gestores de risco a tomar decisões mais rápidas e salvar vidas.
O tema é direto: amenizar os impactos de desastres naturais através de monitoramento espacial contínuo.

O Problema
Enchentes, deslizamentos, ciclones e secas causam devastação todos os anos. Grande parte desses danos poderia ser reduzida com alertas antecipados. O GeoAlert é uma resposta a esse problema.

Como o App Funciona
Ao abrir o app, o usuário passa por uma tela de introdução que explica o propósito do projeto. Em seguida, chega à tela principal onde pode:

Visualizar os alertas climáticos ativos no momento
Filtrar os alertas por tipo de desastre
Ver os detalhes de cada evento, incluindo a fonte satelital que o detectou
Marcar um evento para monitoramento pessoal
Navegar pelas regiões monitoradas ao redor do mundo e filtrar por continente


Fluxo de Telas
Splash (3 segundos)
↓
Introdução (3 páginas com animação — Avançar / Voltar / Pular)
↓
Início (resumo geral + alertas recentes)
↓ botão Alertas          ↓ botão Regiões
Tela de Alertas          Tela de Regiões
↓ tap em qualquer card
Detalhes do Evento (botão Monitorar / Voltar)

Telas do Aplicativo

Splash — Logo do GeoAlert com animação de fade e loading
Introdução — 3 slides animados explicando o app, com botões Avançar, Voltar e Pular
Início — Tela principal com resumo de eventos ativos, atalhos para os módulos e lista dos 3 alertas mais recentes
Alertas — Lista completa de eventos climáticos com filtro por tipo de desastre
Regiões — Regiões monitoradas no mundo todo com filtro por continente
Detalhes do Evento — Informações completas do evento, fonte satelital, coordenadas e botão de monitoramento


Dados Utilizados
O app usa uma lista mockada de 8 eventos climáticos reais, todos baseados em satélites que existem de verdade:
Enchente no Vale do Paraíba — detectada pelo Sentinel-1 da ESA
Seca no Sertão Nordestino — detectada pelo MODIS/Terra da NASA
Queimada no Pantanal — detectada pelo AQUA/MODIS da NASA
Deslizamento na Serra Gaúcha — detectado pelo Jason-CS da CNES/NASA
Ciclone no Litoral Sul — rastreado pelo GOES-16 da NOAA
Erosão Costeira no Ceará — confirmada pelo Landsat-9 do USGS
Tempestade Elétrica em Goiás — detectada pelo GOES-16 da NOAA
Maré Meteorológica na Baixada Santista — monitorada pelo Jason-3 da CNES/NASA
Além disso, 10 regiões monitoradas ao redor do mundo, distribuídas entre América do Sul, América do Norte, África e Ásia.

Organização do Projeto
O projeto foi organizado separando claramente as responsabilidades:
model — define as estruturas de dados
repository — armazena os dados mockados
ui/components — componentes visuais reutilizáveis entre as telas
ui/screens — cada tela do aplicativo em seu próprio arquivo
Componentes criados e reutilizados: LogoApp, BarraSuperior, BadgeSeveridade, CardEvento, CardRegiao e CardEstatistica..


