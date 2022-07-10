import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../../widgets/msgPopup.dart';
import '../../globalUsers.dart';

class LoginStore extends NotifierStore<Exception, int> {
  bool? userAuth = true;
  LoginStore() : super(0) {
    autoLogin();
  }

  void autoLogin() async {
    Directory? appDocDir = await getApplicationDocumentsDirectory();

    Hive.init(appDocDir.path);
    var box = await Hive.openBox('user');
    var user = await box.get(0);
    if (user != null) {
      for (var i = 0; i < Users.listEmailsAcess!.length;) {
        if (user == Users.listEmailsAcess![i]) {
          Modular.to.popAndPushNamed('/home/');
          userAuth = true;
          return;
        }
        i++;
      }
    } else {
      Modular.to.popAndPushNamed('/login/');
    }
  }

  Future<void> authUser({required email}) async {
    for (var i = 0; i < Users.listEmailsAcess!.length;) {
      if (email == Users.listEmailsAcess![i]) {
        userAuth = true;
        Modular.to.pushReplacementNamed('/home/');
        _saveUser(email);
        userAuth = true;
        return;
      }
      i++;
    }
    userAuth = false;
  }

  Future<void> _saveUser(email) async {
    var box = await Hive.openBox('user');
    box.clear();
    box.add(email);
  }

  Future<void> logout() async {
    var box = await Hive.openBox('user');
    box.clear();
    Modular.to.popAndPushNamed('/login/');
  }
}
