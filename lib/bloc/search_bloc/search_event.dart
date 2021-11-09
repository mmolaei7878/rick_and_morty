part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class StartToSearch extends SearchEvent {
  final String query;
  StartToSearch(this.query);
}
