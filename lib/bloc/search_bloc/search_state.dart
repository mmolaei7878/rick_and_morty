part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchNotFoundState extends SearchState {}

class SearchLoaded extends SearchState {
  final CharacterModel? characterModel;
  SearchLoaded(this.characterModel);
}
