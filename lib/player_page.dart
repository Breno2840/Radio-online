import 'package:flutter/material.dart';
import 'radio_station.dart'; // Precisamos saber o que é uma RadioStation

class PlayerPage extends StatelessWidget {
  // Esta tela recebe uma estação de rádio como parâmetro
  final RadioStation station;

  const PlayerPage({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(station.name), // O título da barra será o nome da rádio
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Exibe a imagem da rádio num formato de cartão arredondado
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              clipBehavior: Clip.antiAlias, // Corta a imagem para caber nas bordas arredondadas
              child: Image.network(
                station.imageUrl,
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'A tocar agora',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              station.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 40),
            // Ícones de controle (placeholders por enquanto)
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.skip_previous, size: 48),
                SizedBox(width: 32),
                Icon(Icons.play_arrow, size: 64),
                SizedBox(width: 32),
                Icon(Icons.skip_next, size: 48),
              ],
            )
          ],
        ),
      ),
    );
  }
}
