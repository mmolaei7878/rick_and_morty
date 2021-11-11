import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty/bloc/character_bloc/characterbloc_bloc.dart';
import 'package:rick_and_morty/bloc/search_bloc/search_bloc.dart';
import 'package:rick_and_morty/model/character_model.dart';
import 'package:rick_and_morty/repository/character_repository.dart';
import 'package:rick_and_morty/repository/character_repository_test.dart';

void main() {
  CharacterRepositoryTest characterRepositoryTest;
  late CharacterBloc characterBloc;
  late SearchBloc searchBloc;
  CharacterModel characterModel = CharacterModel(info: Info(count: 1, next: 'nothing', pages: 1), singleCharacter: [
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
  ]);
  setUp(() {
    EquatableConfig.stringify = true;
    characterRepositoryTest = CharacterRepositoryTest();
    characterBloc = CharacterBloc();
    searchBloc = SearchBloc();
  });

  group('emits [CharacterblocLoading, CharacterblocSucess] Succed', () {
    blocTest(
      'check list test',
      build: () => characterBloc,
      act: (CharacterBloc characterBloc) => characterBloc.add(FetchCharacter()),
      wait: const Duration(seconds: 2),
      expect: () => [
        CharacterblocLoading(),
        CharacterblocSucess(characterModel),
      ],
    );
  });

  blocTest('emits [SearchLoadingState, SearchLoaded] Succed',
      build: () => searchBloc,
      act: (SearchBloc searchBloc) => searchBloc.add(StartToSearch('nothing')),
      expect: () => [
            SearchLoadingState(),
            SearchLoaded(characterModel),
          ]);
  tearDown(() {
    characterBloc.close();
  });
}
