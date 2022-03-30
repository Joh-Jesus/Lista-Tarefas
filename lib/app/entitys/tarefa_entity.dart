import 'package:floor/floor.dart';
import 'package:lista_de_tarefas/app/entitys/entity_base.dart';

@Entity(tableName: 'Tarefas')
class TarefaEntity extends EntityBase {
  TarefaEntity({int? id, String? createAt, this.title, this.descricao})
      : super(id, createAt!);

  final String? title;
  final String? descricao;
}
