import 'package:lista_de_tarefas/app/database/database.dart';

class TarefaController {
  late AppDatabase db;

  Future<void> start() async {
    db = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }
}
