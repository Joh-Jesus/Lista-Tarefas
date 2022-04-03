import 'package:lista_de_tarefas/app/database/database.dart';
import 'package:sqflite/sqflite.dart';

import '../models/tarefa.dart';

class TarefaController {
  late AppDatabase db;

  Future start() async {
    db = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }
}
