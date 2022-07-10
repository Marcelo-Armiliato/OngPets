import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/ListPets/listPets_module.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => Dio(BaseOptions(
          baseUrl: '',
          connectTimeout: 5000,
          receiveTimeout: 10000,
          sendTimeout: 10000)),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute('/home/', module: HomeModule()),
    ModuleRoute('/listPets/', module: ListPetsModule()),
  ];
}
