part of 'characterbloc_bloc.dart';

@immutable
abstract class CharacterblocEvent {}

class FetchCharacter extends CharacterblocEvent {}

class FetchCharacterWithPagination extends CharacterblocEvent {}

class FilterCharacter extends CharacterblocEvent {
  final String query;
  FilterCharacter({required this.query});
}
