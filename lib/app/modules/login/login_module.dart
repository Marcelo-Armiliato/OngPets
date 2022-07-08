import 'package:ong_pets/app/modules/login/views/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'views/login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
    ChildRoute('/login/', child: (_, args) => LoginPage()),
  ];
}
