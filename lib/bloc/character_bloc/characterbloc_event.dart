part of 'characterbloc_bloc.dart';

@immutable
abstract class CharacterblocEvent {}

class FetchCharacter extends CharacterblocEvent {}

class FetchCharacterWithPagination extends CharacterblocEvent {}

class SearchCharacter extends CharacterblocEvent {
  final String query;
  SearchCharacter({required this.query});
}
