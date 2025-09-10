// Importa os pacotes necessários.
import 'package:flutter/material.dart'; // Pacote principal do Flutter.
import 'package:audioplayers/audioplayers.dart'; // Pacote para tocar áudio.
import 'radio_station.dart'; // O nosso modelo de dados que criámos antes.

// HomePage é um StatefulWidget porque o seu estado (ex: a música está a tocar ou não) muda.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// A classe _HomePageState contém o estado e a lógica da nossa HomePage.
class _HomePageState extends State<HomePage> {
  // --- Variáveis de Estado ---

  // Cria uma instância do nosso player de áudio.
  final AudioPlayer _audioPlayer = AudioPlayer();
  
  // Variável para controlar se a rádio está a tocar ou não. Começa como 'false'.
  bool _isPlaying = false;

  // --- Dados da Rádio ---
  // Aqui criamos uma instância da nossa rádio de exemplo.
  // NOTA: Podes trocar estes URLs pelos da tua rádio preferida.
  final RadioStation _station = const RadioStation(
    name: 'Rádio Lofi Girl',
    streamUrl: 'https://play.streamaud.io/lofi-girl', // URL pública de streaming
    imageUrl: 'https://i.scdn.co/image/ab67616d0000b2734691a82a2955f84287865f83', // URL da imagem
  );

  // --- Lógica do Player ---

  // Função para tocar a rádio.
  Future<void> _play() async {
    // Usa o método play do audioplayers, passando o URL do stream.
    // UrlSource é o tipo esperado pelo pacote.
    await _audioPlayer.play(UrlSource(_station.streamUrl));
    
    // setState() é crucial! Ele avisa o Flutter que o estado mudou e
    // que a interface precisa de ser redesenhada.
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
  
  // --- Ciclo de Vida do Widget ---
  
  // O método dispose é chamado quando o widget é removido da árvore de widgets.
  // É muito importante libertar os recursos do player para evitar fugas de memória.
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  // --- Construção da Interface (UI) ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rádio Online'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logótipo da Rádio
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                _station.imageUrl,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
                // Mostra um indicador de carregamento enquanto a imagem baixa.
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const SizedBox(
                    height: 200,
                    width: 200,
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
                // Mostra um ícone de erro se a imagem falhar ao carregar.
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.radio, size: 200);
                },
              ),
            ),
            
            const SizedBox(height: 32.0),

            // Nome da Rádio
            Text(
              _station.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            
            const SizedBox(height: 8.0),

            // Status (Tocando / Pausado)
            Text(
              _isPlaying ? 'A Tocar Agora...' : 'Em Pausa',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            
            const SizedBox(height: 32.0),

            // Botão de Play/Pause
            IconButton(
              // O ícone muda dependendo se a rádio está a tocar ou não.
              icon: Icon(
                _isPlaying ? Icons.pause_circle_filled_rounded : Icons.play_circle_filled_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              iconSize: 80.0,
              // A ação do botão também muda.
              onPressed: _isPlaying ? _pause : _play,
            ),
          ],
        ),
      ),
    );
  }
}
