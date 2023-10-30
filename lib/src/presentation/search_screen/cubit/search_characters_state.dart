part of 'search_characters_cubit.dart';

abstract class SearchCharactersState extends Equatable {
  const SearchCharactersState();

  @override
  List<Object?> get props => [];
}

class SearchCharactersInitial extends SearchCharactersState {}

class SearchCharactersLoading extends SearchCharactersState {}

class SearchCharactersSuccess extends SearchCharactersState {
  const SearchCharactersSuccess(this.response);

  final CharactersResponseEntity response;

  @override
  List<Object?> get props => [response];
}

class SearchCharactersFail extends SearchCharactersState {
  const SearchCharactersFail(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
