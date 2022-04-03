import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_tarefas/app/controller/tarefa_controller.dart';
import 'package:lista_de_tarefas/app/database/database.dart';
import 'package:lista_de_tarefas/app/entitys/tarefa_entity.dart';

class TarefaPage extends StatefulWidget {
  final TarefaEntity? tarefa;

  TarefaPage({Key? key, this.tarefa}) : super(key: key);

  @override
  _TarefaPageState createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var _titleController;

  var _descricaoController;

  final controller = Modular.get<TarefaController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController(
        text: widget.tarefa != null ? widget.tarefa!.title : '');
    _descricaoController = TextEditingController(
        text: widget.tarefa != null ? widget.tarefa!.descricao : '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_titleController.text.isNotEmpty &&
              _descricaoController.text.isNotEmpty) {
            var tarefa = TarefaEntity(
              id: widget.tarefa != null ? widget.tarefa!.id : null,
              createAt: DateTime.now().toUtc().toString(),
              title: _titleController.text,
              descricao: _descricaoController.text,
            );
            if (widget.tarefa != null) {
              controller.db.tarefaRepositoryDao.updateItem(tarefa);
            } else {
              controller.db.tarefaRepositoryDao.insertItem(tarefa);
            }

            Navigator.pop(context, true);
          }
        },
        child: Icon(Icons.save),
      ),
      appBar: AppBar(
          title: TextField(
            controller: _titleController,
            cursorColor: Colors.white30,
            showCursor: true,
            style: Theme.of(context).textTheme.headline5,
            decoration: InputDecoration(
                hintText: 'Titulo',
                border: InputBorder.none,
                hintStyle: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white30)),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
            ),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
          actions: <Widget>[
            widget.tarefa != null
                ? IconButton(
                    icon: Icon(
                      Icons.delete,
                    ),
                    onPressed: () {
                      controller.db.tarefaRepositoryDao
                          .deleteItem(widget.tarefa!);
                      Navigator.pop(context, true);
                    },
                  )
                : Container(),
          ]),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _descricaoController,
              decoration: InputDecoration(
                  hintText: 'Descrição', border: InputBorder.none),
            ),
          ],
        ),
      ),
    );
  }
}
