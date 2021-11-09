part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchFailed extends SearchState {}

class SearchSucced extends SearchState {
  final CharacterModel characterModel;
  SearchSucced(this.characterModel);
}

class SearchSuggestion extends SearchState {}
