import '../models/tarefa.dart';

class TarefaController {
  static List<Tarefa> _tarefaLista = [];

  void setTarefa(Tarefa tarefa) {
    TarefaController._tarefaLista.add(tarefa);
  }

  List<Tarefa> getTarefas() {
    return TarefaController._tarefaLista;
  }

  void removeTarefa(Tarefa tarefa) {
    TarefaController._tarefaLista.remove(tarefa);
  }
}
