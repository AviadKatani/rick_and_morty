import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/src/core/error/exceptions.dart';
import 'package:rick_and_morty/src/core/error/failures.dart';
import 'package:rick_and_morty/src/core/network/server_helper.dart';
import 'package:rick_and_morty/src/models/location.dart';

class LocationApiProvider {
  Future<Either<Failure, Location>> fetchLocation(
      String url) async {
    try {
      Location location = Location(url: url);

      var result = await ServerHelper.getRequest(
          url); // Make the network call asynchronously to fetch the London weather data.
      var data = json.decode(result);
      location = Location.fromJson(data);
      return Right(location);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
