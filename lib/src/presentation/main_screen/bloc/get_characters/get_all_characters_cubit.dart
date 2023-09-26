import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/src/domain/entities/CharactersResponseEntity.dart';
import 'package:rick_and_morty_app/src/domain/usecases/get_characters_usecase.dart';

part 'get_all_characters_state.dart';

class GetAllCharactersCubit extends Cubit<GetAllCharactersState> {
  GetAllCharactersCubit(this.useCase) : super(GetAllCharactersInitial()) {
    getAllCharacters();
  }

  final GetAllCharactersUseCase useCase;

  Future<void> getAllCharacters() async {
    try {
      emit(GetAllCharactersLoading());
      final characters = await useCase.getAllCharacters();

      emit(GetAllCharactersSuccess(characters));
    } catch (e) {
      emit(const GetAllCharactersFail('Bir hata oluştu'));
    }
  }
}
