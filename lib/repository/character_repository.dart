import 'package:rick_and_morty/model/character_model.dart';

abstract class CharacterRepository {
  Future<CharacterModel> fetchCharacter();
  Future<CharacterModel> searchCharacter(String query);
}
