import 'package:dio/dio.dart';
import 'package:rick_and_morty/model/character_model.dart';
import 'package:rick_and_morty/repository/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  Dio dio = Dio(
    BaseOptions(baseUrl: "https://rickandmortyapi.com", connectTimeout: 10000, receiveTimeout: 10000),
  );

  @override
  Future<CharacterModel> fetchCharacter([int page = 1]) async {
    try {
      Response response = await dio.get("/api/character?page=$page");
      if (response.statusCode == 200 && response.data != null) {
        return CharacterModel.fromJson(response.data);
      } else {
        return throw Exception('problem in fetchCharacter');
      }
    } on DioError catch (e) {
      return throw Exception(e.error.toString());
    }
  }

  @override
  Future<CharacterModel> searchCharacter(String query, [int page = 1]) async {
    try {
      Response response = await dio.get("/api/character?page=$page&name=$query");
      if (response.statusCode == 200 && response.data != null) {
        return CharacterModel.fromJson(response.data);
      } else {
        return throw Exception('problem in remote searchCharacter');
      }
    } on DioError catch (e) {
      return throw Exception(e.error.toString());
    }
  }
}
