import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/src/domain/entities/CharactersResponseEntity.dart';
import 'package:rick_and_morty_app/src/domain/usecases/get_search_characters_usecase.dart';

part 'search_characters_state.dart';

class SearchCharactersCubit extends Cubit<SearchCharactersState> {
  SearchCharactersCubit(this.useCase) : super(SearchCharactersInitial()) {
    searchCharacters();
  }

  final currentState = SearchCharactersState;
  final GetSearchCharactersUseCase useCase;

  Future<void> searchCharacters() async {
    try {
      final characters = await useCase.getSearchedCharacters();

      emit(SearchCharactersSuccess(characters));
    } catch (e) {
      emit(const SearchCharactersFail('Bir hata oluştu'));
    }
  }
}
