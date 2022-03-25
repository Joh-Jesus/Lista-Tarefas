import 'package:flutter/foundation.dart';
import 'package:lista_de_tarefas/app/database/db.dart';
import 'package:lista_de_tarefas/app/models/tarefa.dart';
import 'package:sqflite/sqflite.dart';

class TarefaRepository extends ChangeNotifier {
  late Database db;
  List<Tarefa> _listaDeTarefas = [];

  int _total = 0;

  get total => _total;
  List<Tarefa> get listaDeTarefas => _listaDeTarefas;

  TarefaRepository() {
    _initRepository();
  }

  _initRepository() async {
    await _getTotal();
  }

  _getTotal() async {
    db = await DB.instance.database;
    List lista = await db.query('lista', limit: 1);
    _total = lista.first['total'];
    notifyListeners();
  }
}
