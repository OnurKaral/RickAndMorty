import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/src/domain/entities/EpisodesResponseEntity.dart';
import 'package:rick_and_morty_app/src/domain/usecases/get_episodes_usecase.dart';

part 'get_all_episodes_state.dart';

class GetAllEpisodesCubit extends Cubit<GetAllEpisodesState> {
  GetAllEpisodesCubit(this.useCase) : super(GetAllEpisodesInitial()) {
    getAllEpisodes();
  }

  final currentState = GetAllEpisodesState;
  final GetAllEpisodesUseCase useCase;

  Future<void> getAllEpisodes() async {
    try {
      final episodes = await useCase.getAllEpisodes();

      emit(GetAllEpisodesSuccess(episodes));
    } catch (e) {
      emit(const GetAllEpisodesFail('Bir hata oluştu'));
    }
  }
}
