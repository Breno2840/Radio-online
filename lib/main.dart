import 'package:flutter/material.dart';

// A função main() é o portão de entrada da nossa aplicação.
// Ela chama a função runApp() para iniciar o nosso widget principal.
void main() {
  runApp(const RadioApp());
}

// Este é o widget raiz da aplicação, o "molde" principal.
// É um StatelessWidget porque, por agora, ele não precisa de gerir nenhum estado que mude.
class RadioApp extends StatelessWidget {
  const RadioApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp é o widget que configura a nossa aplicação para seguir
    // as diretrizes do Material Design.
    return MaterialApp(
      // Título da aplicação (visível na gestão de apps do sistema operativo).
      title: 'Rádio Online',
      
      // Remove a pequena faixa de "DEBUG" que aparece no canto.
      debugShowCheckedModeBanner: false,
      
      // Aqui acontece a magia do tema que pediste.
      theme: ThemeData(
        // Ativamos o Material 3 para ter o visual mais recente.
        useMaterial3: true,
        
        // A partir de uma única cor (seedColor), o Flutter gera uma paleta
        // de cores completa e harmoniosa para botões, textos, fundos, etc.
        colorScheme: ColorScheme.fromSeed(
          // Escolhi um roxo escuro como base. Sente-te à vontade para mudar!
          seedColor: Colors.deepPurple,
          
          // Garantimos que a paleta gerada seja para um tema escuro.
          brightness: Brightness.dark,
        ),
      ),
      
      // Define qual será o primeiro ecrã a ser exibido.
      home: const HomePage(),
    );
  }
}

// HomePage é o nosso primeiro ecrã.
// Também é um StatelessWidget porque, por enquanto, ele apenas exibe informação.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // O Scaffold é um "esqueleto" para o nosso ecrã. Ele já vem com espaços
    // preparados para uma barra no topo (AppBar), o corpo do ecrã (body), etc.
    return Scaffold(
      // A barra no topo do ecrã.
      appBar: AppBar(
        // Usamos a cor primária do nosso tema (que foi gerada a partir do roxo) para o fundo.
        backgroundColor: Theme.of(context).colorScheme.primary,
        // O texto que vai aparecer na barra.
        title: const Text(
          'Minha Rádio FM',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // Centraliza o título.
        centerTitle: true,
      ),
      // O conteúdo principal do ecrã.
      body: Center(
        // O widget Center alinha o seu filho no meio do espaço disponível.
        child: Column(
          // Alinha os widgets na vertical, no centro.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Um ícone para dar um aspeto visual.
            Icon(
              Icons.radio_rounded,
              // Usamos a cor primária do tema para dar destaque.
              color: Theme.of(context).colorScheme.primary,
              size: 120.0,
            ),
            
            // Um pequeno espaço entre o ícone e o texto.
            const SizedBox(height: 24.0),
            
            // Texto a indicar o estado.
            const Text(
              'A Rádio está em Pausa',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
