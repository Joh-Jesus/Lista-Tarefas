import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/models/tarefa.dart';

class BoxItem extends StatelessWidget {
  final Tarefa tarefa;

  BoxItem(this.tarefa);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        color: Color.fromARGB(221, 170, 161, 161),
        child: Column(
          children: [
            Row(
              children: [
                Text(tarefa.title),
                SizedBox(width: 10),
                Text("${tarefa.dataDeCriacao}"),
              ],
            ),
            SizedBox(height: 3),
            Text(tarefa.descriacao),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
