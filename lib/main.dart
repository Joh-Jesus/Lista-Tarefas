import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/app_module.dart';
import 'package:lista_de_tarefas/app/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
