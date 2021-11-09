import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/model/character_model.dart';
import 'package:rick_and_morty/repository/character_repository.dart';

part 'characterbloc_event.dart';
part 'characterbloc_state.dart';

class CharacterBloc extends Bloc<CharacterblocEvent, CharacterblocState> {
  final characterRepository = CharacterRepository();
  int page = 1;
  bool firstTime = true;
  late CharacterModel characterModel;

  CharacterBloc() : super(CharacterblocInitial()) {
    on<FetchCharacter>(_onInit);
    on<FetchCharacterWithPagination>(_fetchCharacterWithPagination);
  }
  void _onInit(CharacterblocEvent event, Emitter<CharacterblocState> emit) async {
    emit(CharacterblocLoading());
    try {
      final CharacterModel character = await characterRepository.fetchCharacter();
      emit(CharacterblocSucess(character));
      characterModel = character;
    } catch (e) {
      emit(CharacterblocError());
    }
  }

  void _fetchCharacterWithPagination(CharacterblocEvent event, Emitter<CharacterblocState> emit) async {
    page++;
    try {
      final CharacterModel ch = await characterRepository.fetchCharacter(page);
      characterModel.singleCharacter.addAll(ch.singleCharacter);
      emit(CharacterblocSucess(characterModel));
    } catch (e) {
      emit(CharacterblocError());
    }
  }
}
