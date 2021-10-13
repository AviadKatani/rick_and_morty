import 'package:bloc/bloc.dart';
import 'package:rick_and_morty/src/core/error/exceptions.dart';
import 'package:rick_and_morty/src/models/character.dart';
import 'package:rick_and_morty/src/models/location.dart';
import 'package:rick_and_morty/src/resources/location/location_repository.dart';
import 'package:rick_and_morty/src/ui/screens/detailed_character_screen/bloc/detailed_character_event.dart';
import 'package:rick_and_morty/src/ui/screens/detailed_character_screen/bloc/detailed_character_state.dart';

class DetailedCharacterBloc
    extends Bloc<DetailedCharacterEvent, DetailedCharacterState> {
  final Character character;

  DetailedCharacterBloc({required this.character})
      : super(InitialDetailedCharacterState()) {}

  @override
  Stream<DetailedCharacterState> mapEventToState(
    DetailedCharacterEvent event,
  ) async* {
    final currentState = state;
    if (event is FetchingLocation) {
      try {
        if (currentState is InitialDetailedCharacterState) {
          Location locationData = Location(url: character.location.url);
          Location originData = Location(url: character.origin.url);
          if (character.location.url != '') {
            locationData = await _fetchLocation(character.location.url);
          }
          if (character.origin.url != '') {
            originData = await _fetchLocation(character.origin.url);
          }
            final Map<String, Location> data = {
              'locationData': locationData,
              'originData': originData,
            };

            yield DetailedCharacterLoaded(locationsData: data);
            return;
          }
      } catch (e, s) {
        print("$e, $s");
        yield DetailedCharacterError();
      }
    }
  }

  Future<Location> _fetchLocation(String url) async {
    var data;
    var response = await LocationRepository().fetchLocation(url);
    response.fold((l) => throw (ServerException), (r) => data = r);
    return data;
  }
}
