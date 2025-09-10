import 'package:flutter/material.dart';
import 'home_page.dart'; // Vamos criar este ficheiro a seguir

void main() {
  runApp(const RadioApp());
}

class RadioApp extends StatelessWidget {
  const RadioApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp é o widget principal da nossa aplicação
    return MaterialApp(
      title: 'Rádio Online',
      debugShowCheckedModeBanner: false, // Remove a faixa de "Debug" no canto
      
      // Aqui definimos o tema da aplicação
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple, // Cor base para o Material You
          brightness: Brightness.dark,   // Define o tema como escuro
        ),
        useMaterial3: true, // Ativa o design Material You (Material 3)
      ),
      
      // Define a tela inicial da aplicação
      home: const HomePage(),
    );
  }
}
