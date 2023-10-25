part of 'get_all_episodes_cubit.dart';

abstract class GetAllEpisodesState extends Equatable {
  const GetAllEpisodesState();

  @override
  List<Object?> get props => [];
}

class GetAllEpisodesInitial extends GetAllEpisodesState {}

class GetAllEpisodesLoading extends GetAllEpisodesState {}

class GetAllEpisodesSuccess extends GetAllEpisodesState {
  const GetAllEpisodesSuccess(this.response);

  final EpisodesResponseEntity response;

  @override
  List<Object?> get props => [response];
}

class GetAllEpisodesFail extends GetAllEpisodesState {
  const GetAllEpisodesFail(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
