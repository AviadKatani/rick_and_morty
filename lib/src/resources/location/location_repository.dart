import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/src/core/error/failures.dart';
import 'package:rick_and_morty/src/models/location.dart';
import 'package:rick_and_morty/src/resources/location/location_api_provider.dart';

class LocationRepository {
  final locationApiProvider = LocationApiProvider();

  Future<Either<Failure, Location>> fetchLocation(String name) =>
      locationApiProvider.fetchLocation(name);
}
