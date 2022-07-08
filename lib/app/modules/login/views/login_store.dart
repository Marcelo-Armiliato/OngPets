import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LoginStore extends NotifierStore<Exception, int> {
  LoginStore() : super(0) {
    autoLogin();
  }
  List? listEmailsAcess = [
    'marcelo@gmail.com',
    'joana@gmail.com',
    'yasmin@gmail.com',
    'maria@gmail.com',
    'juliana@gmail.com',
    'isadora@gmail.com',
    'vanessa@gmail.com',
  ];

  void autoLogin() async {
    Directory? appDocDir = await getApplicationDocumentsDirectory();

    Hive.init(appDocDir.path);
    var box = await Hive.openBox('user');
    var user = await box.get(0);
    if (user != null) {
      for (var i = 0; i < listEmailsAcess!.length;) {
        if (user == listEmailsAcess![i]) {
          Modular.to.popAndPushNamed('/home/');
          return;
        }
        i++;
      }
    } else {
      Modular.to.popAndPushNamed('/login/');
    }
  }

  Future<void> authUser({required email}) async {
    for (var i = 0; i < listEmailsAcess!.length;) {
      if (email == listEmailsAcess![i]) {
        Modular.to.popAndPushNamed('/home/');
        _saveUser(email);
        return;
      }
      i++;
    }
  }

  Future<void> _saveUser(email) async {
    var box = await Hive.openBox('user');
    box.clear();
    box.add(email);
  }
}
