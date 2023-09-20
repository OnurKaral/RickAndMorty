part of 'get_all_characters_cubit.dart';

abstract class GetAllCharactersState extends Equatable {
  const GetAllCharactersState();

  @override
  List<Object?> get props => [];
}

class GetAllCharactersInitial extends GetAllCharactersState {}

class GetAllCharactersLoading extends GetAllCharactersState {}

class GetAllCharactersSuccess extends GetAllCharactersState {
  const GetAllCharactersSuccess(this.response);

  final CharactersResponseEntity response;

  @override
  List<Object?> get props => [response];
}

class GetAllCharactersFail extends GetAllCharactersState {
  const GetAllCharactersFail(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
