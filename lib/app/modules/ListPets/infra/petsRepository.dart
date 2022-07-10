import 'package:dio/dio.dart';

import '../domain/listCats_model.dart';
import '../domain/listDogs_model.dart';

class ListPetsRepository {
  final Dio _api;
  ListPetsRepository(this._api);

  Future<List<ListDogsModel>> listDogs() async {
    try {
      Response response = await _api.get(
        'https://api.thedogapi.com/v1/breeds',
        options: Options(headers: {
          "Content-type": "application/json",
          "x-api-key": "b60cf25e-3274-47b6-a9a1-2a20a2636648",
        }),
      );
      List<ListDogsModel> data = [];
      for (var item in response.data) {
        data.add(ListDogsModel.fromJson(item));
      }
      return data;
    } on DioError catch (e) {
      rethrow;
    }
  }

  Future<List<ListCatsModel>> listCats() async {
    try {
      Response response = await _api.get(
        'https://api.thecatapi.com/v1/breeds',
        options: Options(headers: {
          "Content-type": "application/json",
          "x-api-key": "47f412d7-8ddc-47b2-b5ee-7746bd70e4a0",
        }),
      );
      List<ListCatsModel> data = [];
      for (var item in response.data!) {
        data.add(ListCatsModel.fromJson(item));
      }
      return data;
    } on DioError catch (e) {
      rethrow;
    }
  }
}
