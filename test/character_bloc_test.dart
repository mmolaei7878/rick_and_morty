import 'dart:convert';
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/bloc/character_bloc/characterbloc_bloc.dart';
import 'package:rick_and_morty/model/character_model.dart';
import 'fixture/fixture_reader.dart';

void main() {
  late CharacterBloc characterBloc;
  final characterModel = CharacterModel.fromJson(
    json.decode(
      fixture('character_model_response.json'),
    ),
  );
  setUp(() {
    EquatableConfig.stringify = true;
    characterBloc = CharacterBloc();
  });

  group('Character Bloc Test', () {
    group('Bloc test', () {
      blocTest(
        'Fetch homeScreen Character List => emits [CharacterblocLoading(), CharacterblocSucess()]',
        build: () => characterBloc,
        act: (CharacterBloc characterBloc) => characterBloc.add(FetchCharacter()),
        wait: const Duration(seconds: 2),
        expect: () => [
          CharacterblocLoading(),
          CharacterblocSucess(characterModel),
        ],
      );
    });
  });
  tearDown(() {
    characterBloc.close();
  });
}
