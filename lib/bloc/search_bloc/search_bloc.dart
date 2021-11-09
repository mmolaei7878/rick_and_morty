import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/model/character_model.dart';
import 'package:rick_and_morty/repository/character_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final characterRepository = CharacterRepository();

  late final CharacterModel characterModel;
  SearchBloc() : super(SearchInitial()) {
    on<StartToSearch>(_search);
  }
  void _search(StartToSearch event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    try {
      final CharacterModel ch = await characterRepository.searchCharacter(event.query);
      characterModel.singleCharacter.addAll(ch.singleCharacter);
      emit(SearchSucced(characterModel));
    } catch (e) {
      emit(SearchFailed());
    }
  }
}
