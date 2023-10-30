import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/src/domain/entities/CharactersResponseEntity.dart';
import 'package:rick_and_morty_app/src/domain/usecases/get_search_characters_usecase.dart';

part 'search_characters_state.dart';

class SearchCharactersCubit extends Cubit<SearchCharactersState> {
  SearchCharactersCubit(this.useCase) : super(SearchCharactersInitial());

  final currentState = SearchCharactersState;
  final GetSearchCharactersUseCase useCase;

  Future<void> searchCharacters(String gender, String status) async {
    try {
      final characters = await useCase.getSearchedCharacters(gender, status);

      emit(SearchCharactersSuccess(characters));
    } catch (e) {
      emit(const SearchCharactersFail('Bir hata oluştu'));
    }
  }
}
