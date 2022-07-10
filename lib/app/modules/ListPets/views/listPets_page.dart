import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import '../../../widgets/cabecalhoNavigation.dart';
import '../store/listDogs_store.dart';

class ListPetsPage extends StatefulWidget {
  final String title;
  const ListPetsPage({Key? key, this.title = 'ListPetsPage'}) : super(key: key);
  @override
  ListPetsPageState createState() => ListPetsPageState();
}

class ListPetsPageState extends State<ListPetsPage> {
  // final ListPetsStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CabecalhoNavigation(nameTela: 'CÃES'),
          ],
        ),
      ),
    );
  }
}
