import 'package:rick_and_morty/src/models/character.dart';

abstract class CharactersState {
  const CharactersState();
}

class InitialCharactersState extends CharactersState {
  InitialCharactersState() : super();
}

class LoadingCharactersState extends CharactersState {
  LoadingCharactersState() : super();
}

class CharactersLoaded extends CharactersState {
  final List<Character> characters;
  final bool hasReachedBottom;
  final int nextPage;

  CharactersLoaded(
      {required this.hasReachedBottom,
      required this.characters,
      required this.nextPage})
      : super();
}

class CharactersError extends CharactersState {
  CharactersError() : super();
}
