import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/model/character_model.dart';
import 'package:rick_and_morty/repository/character_repository_impl.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final characterRepository = CharacterRepositoryImpl();
  CharacterModel? characterModel;
  SearchBloc() : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is StartToSearch) {
      yield SearchLoadingState();
      try {
        final CharacterModel ch = await characterRepository.searchCharacter(event.query);
        characterModel = ch;
        yield SearchLoaded(characterModel);
      } catch (e) {
        print(e);
        yield SearchNotFoundState();
      }
    }
  }
}
