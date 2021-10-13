import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/src/core/error/exceptions.dart';
import 'package:rick_and_morty/src/core/error/failures.dart';
import 'package:rick_and_morty/src/core/network/server_helper.dart';
import 'package:rick_and_morty/src/models/character.dart';
import 'package:rick_and_morty/src/resources/characters/response_model.dart';

class CharactersApiProvider {
  Future<Either<Failure, ResponseModel>> fetchCharacters(int page) async {
    try {
      List<Character> characters = <Character>[];

      var result = await ServerHelper.getApiRequest(
          'character/?page=$page'); // Make the network call asynchronously to fetch the London weather data.
      var data = json.decode(result);

      for (var characterData in data['results']) {
        characters.add(new Character.fromJson(characterData));
      }

      ResponseModel response =
          ResponseModel(data['info']['next'] != null, page + 1, characters);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
