import 'package:flutter/material.dart';
import 'radio_station.dart'; // Importa nosso modelo de dados
import 'player_page.dart';   // Importa a tela do player que vamos criar a seguir

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Lista de rádios de exemplo. No futuro, isto pode vir de uma API.
  final List<RadioStation> stations = [
    RadioStation(
      name: 'Rádio Rock Clássico',
      streamUrl: 'URL_DO_STREAM_1',
      imageUrl: 'https://picsum.photos/seed/1/200', // Imagem de exemplo
    ),
    RadioStation(
      name: 'Jazz Lounge',
      streamUrl: 'URL_DO_STREAM_2',
      imageUrl: 'https://picsum.photos/seed/2/200',
    ),
    RadioStation(
      name: 'Pop Hits Brasil',
      streamUrl: 'URL_DO_STREAM_3',
      imageUrl: 'https://picsum.photos/seed/3/200',
    ),
    RadioStation(
      name: 'Eletrônica Vibes',
      streamUrl: 'URL_DO_STREAM_4',
      imageUrl: 'https://picsum.photos/seed/4/200',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra no topo da aplicação
      appBar: AppBar(
        title: const Text('Rádio Online'),
        centerTitle: true,
        elevation: 4, // Adiciona uma sombra sutil
      ),
      // Corpo da aplicação
      body: ListView.builder(
        itemCount: stations.length, // O número de itens na lista é o tamanho da nossa lista de rádios
        itemBuilder: (context, index) {
          final station = stations[index];
          // ListTile é um widget ótimo para criar linhas em uma lista
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(station.imageUrl),
            ),
            title: Text(station.name),
            subtitle: const Text('Toque para ouvir'),
            onTap: () {
              // Ação ao tocar no item: navegar para a tela do player
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayerPage(station: station),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
