import 'package:flutter_modular/flutter_modular.dart';

import 'domain/listCats_model.dart';
import 'domain/listDogs_model.dart';
import 'infra/petsRepository.dart';
import 'views/catInfo_page.dart';
import 'views/dogInfo_page.dart';
import 'views/listCats_page.dart';
import 'store/listCats_store.dart';
import 'views/listDogs_page.dart';
import 'store/listDogs_store.dart';
import 'views/listPets_page.dart';

class ListPetsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ListPetsRepository(i())),
    Bind.lazySingleton((i) => ListDogsStore(i(), i())),
    Bind.lazySingleton((i) => ListDogsModel()),
    Bind.lazySingleton((i) => ListCatsStore(i(), i())),
    Bind.lazySingleton((i) => ListCatsModel()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ListPetsPage()),
    ChildRoute('/cats', child: (_, args) => const ListCatsPage()),
    ChildRoute('/dogs', child: (_, args) => const ListDogsPage()),
    ChildRoute('/infoDog', child: (_, args) => const dogInfoPage()),
    ChildRoute('/infoCat', child: (_, args) => const catInfoPage()),
  ];
}
