import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_tarefas/app/database/database.dart';
import 'package:lista_de_tarefas/app/views/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
//        ChildRoute('/', child: (_, __) => HomePage()),
      ];
}
