import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      title: 'Ong Pets',
      theme: ThemeData(
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(primary: Colors.blue),
          ),
          textTheme:
              const TextTheme(bodyText1: TextStyle(color: Colors.black))),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      locale: const Locale('pt', 'BR'),
    );
  }
}