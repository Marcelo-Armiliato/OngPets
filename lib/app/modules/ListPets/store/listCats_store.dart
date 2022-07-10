import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../domain/listCats_model.dart';
import '../infra/petsRepository.dart';

class ListCatsStore extends NotifierStore<Exception, List<ListCatsModel>> {
  ListPetsRepository _repository;
  ListCatsModel dataCats;
  ListCatsStore(this._repository, this.dataCats) : super([]);

  Future<void> listCats() async {
    execute(() {
      return _repository.listCats();
    }).catchError((error) {
      if (error is DioError) {
        setLoading(false);
        setError(Exception(error.message));
      }
    });
  }
}
