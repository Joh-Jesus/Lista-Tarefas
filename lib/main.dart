import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/views/criar_tarefa.dart';
import 'package:lista_de_tarefas/app/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de tarefas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/criar': (context) => CriarTarefas(),
      },
    );
  }
}
