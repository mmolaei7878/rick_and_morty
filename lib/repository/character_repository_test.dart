import 'package:rick_and_morty/model/character_model.dart';
import 'package:rick_and_morty/repository/repository.dart';

class CharacterRepositoryTest implements Repository {
  final List<SingleCharacter> mockData = [
    SingleCharacter(
        id: 1,
        name: 'mohammad',
        status: 'DEAD',
        species: 'species',
        type: 'type',
        gender: 'male',
        origin: Origin(name: '', url: 'url'),
        location: Location(name: 'name', url: 'url'),
        image: 'image',
        episode: [],
        url: 'url',
        created: 'created'),
    SingleCharacter(
        id: 2,
        name: 'ali',
        status: 'Alive',
        species: 'species',
        type: 'type',
        gender: 'female',
        origin: Origin(name: '', url: 'url'),
        location: Location(name: 'name', url: 'url'),
        image: 'image',
        episode: [],
        url: 'url',
        created: 'created'),
    SingleCharacter(
        id: 3,
        name: 'majid',
        status: 'Unknown',
        species: 'species',
        type: 'type',
        gender: 'male',
        origin: Origin(name: '', url: 'url'),
        location: Location(name: 'name', url: 'url'),
        image: 'image',
        episode: [],
        url: 'url',
        created: 'created'),
  ];
  @override
  Future<CharacterModel> fetchCharacter() async => await Future.delayed(const Duration(seconds: 2),
      () async => CharacterModel(info: Info(count: 1, next: 'nothing', pages: 1), singleCharacter: [...mockData]));

  @override
  Future<CharacterModel> searchCharacter(String query) async => await Future.delayed(const Duration(seconds: 2),
      () async => CharacterModel(info: Info(count: 1, next: 'nothing', pages: 1), singleCharacter: [...mockData]));
}
