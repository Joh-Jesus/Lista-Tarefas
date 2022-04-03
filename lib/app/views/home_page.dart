import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_tarefas/app/controller/tarefa_controller.dart';
import 'package:lista_de_tarefas/app/database/database.dart';
import 'package:lista_de_tarefas/app/entitys/tarefa_entity.dart';
import 'package:lista_de_tarefas/app/views/components/box_item.dart';
import 'package:lista_de_tarefas/app/views/tarefa_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<TarefaController>();
  @override
  initState() {
    // TODO: implement initState
    super.initState();

    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.navigate('/tarefa');
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          "Minhas tarefas",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder<List<TarefaEntity?>>(
            future: controller.db.tarefaRepositoryDao.getAll(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                          onTap: () async {
                            var result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return TarefaPage(
                                    tarefa: snapshot.data![index],
                                  );
                                },
                              ),
                            );
                            if (result) {
                              setState(() {});
                            }
                          },
                          title: Text(snapshot.data![index]!.title!),
                          subtitle: Text(snapshot.data![index]!.descricao!),
                        ));
                      })
                  : Center(child: Text('Ainda não há tarefas...'));
            }),
      ),
    );
  }
}
