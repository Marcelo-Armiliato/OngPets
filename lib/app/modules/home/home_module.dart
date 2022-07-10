import 'package:flutter_modular/flutter_modular.dart';
import 'views/UsersAcess_page.dart';
import 'views/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
    ChildRoute('/usersAcess', child: (_, args) => const UsersAcessPage()),
  ];
}
