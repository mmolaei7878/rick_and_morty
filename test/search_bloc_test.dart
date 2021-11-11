import 'dart:convert';
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/bloc/search_bloc/search_bloc.dart';
import 'package:rick_and_morty/model/character_model.dart';
import 'fixture/fixture_reader.dart';

void main() {
  late SearchBloc searchBloc;
  final characterModel = CharacterModel.fromJson(
    json.decode(
      fixture('character_model_response.json'),
    ),
  );
  setUp(() {
    EquatableConfig.stringify = true;
    searchBloc = SearchBloc();
  });

  group('Search Bloc Test', () {
    blocTest('emits [SearchLoadingState, SearchLoaded]',
        build: () => searchBloc,
        act: (SearchBloc searchBloc) => searchBloc.add(StartToSearch('rick')),
        expect: () => [
              SearchLoadingState(),
              SearchLoaded(characterModel),
            ]);
    blocTest('emits [SearchLoadingState, SearchNotFoundState]',
        build: () => searchBloc,
        act: (SearchBloc searchBloc) => searchBloc.add(StartToSearch('some random value')),
        expect: () => [
              SearchLoadingState(),
              SearchNotFoundState(),
            ]);
  });
  tearDown(() {
    searchBloc.close();
  });
}
