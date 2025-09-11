import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'radio_station.dart';

// Este é o nosso widget de player, agora independente e reutilizável.
class PlayerWidget extends StatefulWidget {
  // Ele recebe uma estação de rádio para saber o que tocar.
  final RadioStation station;

  // O construtor exige que uma 'station' seja fornecida sempre que este widget for usado.
  const PlayerWidget({
    super.key,
    required this.station,
  });

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  // A lógica do player agora vive aqui.
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void dispose() {
    // É importante libertar os recursos do player quando o widget é destruído.
    _audioPlayer.dispose();
    super.dispose();
  }

  // Função para tocar a rádio.
  Future<void> _play() async {
    // Usamos 'widget.station' para aceder à estação que foi passada para este widget.
    await _audioPlayer.play(UrlSource(widget.station.streamUrl));
    setState(() {
      _isPlaying = true;
    });
  }

  // Função para pausar a rádio.
  Future<void> _pause() async {
    await _audioPlayer.pause();
    setState(() {
      _isPlaying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // A interface do player, que antes estava na HomePage.
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Logótipo da Rádio
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.network(
            widget.station.imageUrl, // Usa a imagem da estação fornecida.
            height: 200,
            width: 200,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const SizedBox(
                height: 200,
                width: 200,
                child: Center(child: CircularProgressIndicator()),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.radio, size: 200);
            },
          ),
        ),
        
        const SizedBox(height: 32.0),

        // Nome da Rádio
        Text(
          widget.station.name, // Usa o nome da estação fornecida.
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        
        const SizedBox(height: 8.0),

        // Status (Tocando / Pausado)
        Text(
          // ===== ALTERAÇÃO FEITA AQUI =====
          _isPlaying ? 'Tocando Agora...' : 'Pausado',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        
        const SizedBox(height: 32.0),

        // Botão de Play/Pause
        IconButton(
          icon: Icon(
            _isPlaying ? Icons.pause_circle_filled_rounded : Icons.play_circle_filled_rounded,
            color: Theme.of(context).colorScheme.primary,
          ),
          iconSize: 80.0,
          onPressed: _isPlaying ? _pause : _play,
        ),
      ],
    );
  }
}
