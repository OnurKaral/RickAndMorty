import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/src/domain/entities/EpisodesResponseEntity.dart';
import 'package:rick_and_morty_app/src/domain/usecases/get_episodes_usecase.dart';

part 'get_all_episodes_state.dart';

class GetAllEpisodesCubit extends Cubit<GetAllEpisodesState> {
  GetAllEpisodesCubit(this.useCase) : super(GetAllEpisodesInitial()) {
    getAllCharacters();
  }

  final currentState = GetAllEpisodesState;
  final GetAllEpisodesUseCase useCase;

  Future<void> getAllCharacters() async {
    try {
      final characters = await useCase.getAllEpisodes();

      emit(GetAllEpisodesSuccess(characters));
    } catch (e) {
      emit(const GetAllEpisodesFail('Bir hata oluştu'));
    }
  }
}
