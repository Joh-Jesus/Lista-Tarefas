import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/controller/tarefa_controller.dart';
import 'package:lista_de_tarefas/app/views/components/box_item.dart';

class HomePage extends StatefulWidget {
  final TarefaController controller = TarefaController();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var listaTarefas = widget.controller.getTarefas();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lista de tarefas",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 0,
                  itemBuilder: (context, index) {
                    return BoxItem(listaTarefas[index]);
                  }),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(context, '/criar');
                  },
                  label: Text("Criar Nova Tarefa")),
            )
          ],
        ),
      ),
    );
  }
}
