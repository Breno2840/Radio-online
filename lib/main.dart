import 'package:flutter/material.dart';
import 'home_page.dart'; // Importa o nosso novo ecrã HomePage.

void main() {
  runApp(const RadioApp());
}

// O widget principal da aplicação, que apenas configura o tema e chama o ecrã inicial.
class RadioApp extends StatelessWidget {
  const RadioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rádio Online',
      debugShowCheckedModeBanner: false,
      
      // O tema escuro Material 3 continua a ser definido aqui, para toda a aplicação.
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      
      // A grande mudança está aqui: 'home' agora aponta para o widget HomePage
      // que importámos do ficheiro 'home_page.dart'.
      home: const HomePage(),
    );
  }
}
