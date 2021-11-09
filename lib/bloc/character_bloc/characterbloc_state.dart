part of 'characterbloc_bloc.dart';

@immutable
abstract class CharacterblocState {}

class CharacterblocInitial extends CharacterblocState {}

class CharacterblocLoading extends CharacterblocState {}

class CharacterblocError extends CharacterblocState {}

class CharacterblocSucess extends CharacterblocState {
  final CharacterModel characterModel;
  CharacterblocSucess(this.characterModel);
}
