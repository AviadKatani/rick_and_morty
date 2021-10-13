import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/src/core/error/failures.dart';
import 'package:rick_and_morty/src/resources/characters/characters_api_provider.dart';
import 'package:rick_and_morty/src/resources/characters/response_model.dart';

class CharactersRepository {
  final charactersApiProvider = CharactersApiProvider();

  Future<Either<Failure, ResponseModel>> fetchCharacter(int page) =>
      charactersApiProvider.fetchCharacters(page);
}
