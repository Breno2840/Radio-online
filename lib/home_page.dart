import 'package:flutter/material.dart';
import 'radio_station.dart'; // Precisamos do nosso modelo de dados.
import 'player_page.dart';   // E precisamos do nosso novo PlayerWidget.

// A HomePage agora pode voltar a ser um StatelessWidget!
// Ela já não precisa de gerir o estado de play/pause, pois essa é a
// responsabilidade do PlayerWidget.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Aqui definimos a estação de rádio que queremos tocar.
  // No futuro, isto pode vir de uma lista ou de uma base de dados.
  final RadioStation station = const RadioStation(
    name: 'Rádio Lofi Girl',
    streamUrl: 'https://play.streamaud.io/lofi-girl',
    imageUrl: 'https://i.scdn.co/image/ab67616d0000b2734691a82a2955f84287865f83',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Rádio FM'),
        centerTitle: true,
      ),
      // O corpo do ecrã agora é muito simples.
      body: Center(
        // Apenas chamamos o nosso PlayerWidget, passando a estação que queremos tocar.
        child: PlayerWidget(
          station: station,
        ),
      ),
    );
  }
}
