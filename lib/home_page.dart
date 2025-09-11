import 'package:flutter/material.dart';
import 'radio_station.dart'; // Precisamos do nosso modelo de dados.
import 'player_page.dart';   // E precisamos do nosso novo PlayerWidget.

// A HomePage agora pode voltar a ser um StatelessWidget!
// Ela já não precisa de gerir o estado de play/pause, pois essa é a
// responsabilidade do PlayerWidget.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // ===== ALTERAÇÃO FEITA AQUI =====
  // Trocamos os dados da rádio para a Rádio Dence.
  final RadioStation station = const RadioStation(
    name: 'Rádio Dence', // Nome novo
    streamUrl: 'https://servidor32-2.brlogic.com:8198/live', // Link novo
    imageUrl: 'https://i.scdn.co/image/ab67616d0000b2734691a82a2955f84287865f83', // Imagem mantida (leia o aviso abaixo)
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
