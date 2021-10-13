import 'package:rick_and_morty/src/models/location.dart';

abstract class DetailedCharacterState {
  const DetailedCharacterState();
}

class InitialDetailedCharacterState extends DetailedCharacterState {
  InitialDetailedCharacterState() : super();
}

class LoadingDetailedCharacterState extends DetailedCharacterState {
  LoadingDetailedCharacterState() : super();
}

class DetailedCharacterLoaded extends DetailedCharacterState {
  final Map<String, Location> locationsData;

  DetailedCharacterLoaded({required this.locationsData});
}

class DetailedCharacterError extends DetailedCharacterState {
  DetailedCharacterError() : super();
}
