import 'package:dio/dio.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../domain/listDogs_model.dart';
import '../infra/petsRepository.dart';

class ListDogsStore extends NotifierStore<Exception, List<ListDogsModel>> {
  ListDogsModel dogsData;
  final ListPetsRepository _repository;
  ListDogsStore(this._repository, this.dogsData) : super([]);

  Future<void> listDogs() async {
    execute(() {
      return _repository.listDogs();
    }).catchError((error) {
      if (error is DioError) {
        setLoading(false);
        setError(Exception(error.message));
      }
    });
  }
}
