import 'dart:async';

import 'package:floor/floor.dart';
import 'package:lista_de_tarefas/app/entitys/tarefa_entity.dart';
import 'package:lista_de_tarefas/app/repository/tarefa_repository_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [TarefaEntity])
abstract class AppDatabase extends FloorDatabase {
  TarefaRepositoryDao get tarefaRepositoryDao;
}
