import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/database/database.dart';
import 'package:lista_de_tarefas/app/views/home_page.dart';

class AppWidget extends StatelessWidget {
  final AppDatabase db;

  const AppWidget({Key? key, required this.db}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(db: db),
    );
  }
}
