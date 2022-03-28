import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/app_module.dart';
import 'package:lista_de_tarefas/app/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_tarefas/app/database/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ModularApp(
      module: AppModule(),
      child: AppWidget(
        db: await $FloorAppDatabase.databaseBuilder('app_database.db').build(),
      )));
}
