import 'package:floor/floor.dart';
import 'package:lista_de_tarefas/app/entitys/tarefa_entity.dart';
import 'package:lista_de_tarefas/app/repository/interfaces/repository_dao_interface.dart';

@dao
abstract class TarefaRepositoryDao
    extends IRepositoryDaoInterface<TarefaEntity> {
  @Query('SELECT * FROM Tarefas WHERE id = :id')
  Future<TarefaEntity?> getById(int id);

  @Query('SELECT * FROM Tarefas')
  Future<List<TarefaEntity?>> getAll();
}
