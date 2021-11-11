part of 'characterbloc_bloc.dart';

@immutable
abstract class CharacterblocState extends Equatable {
  @override
  List<Object> get props => [];
}

class CharacterblocInitial extends CharacterblocState {}

class CharacterblocLoading extends CharacterblocState {}

class CharacterblocError extends CharacterblocState {}

class CharacterblocSucess extends CharacterblocState {
  final CharacterModel characterModel;
  CharacterblocSucess(this.characterModel);
}
