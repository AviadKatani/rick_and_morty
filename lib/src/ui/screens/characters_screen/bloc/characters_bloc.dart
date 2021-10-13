import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/src/core/error/exceptions.dart';
import 'package:rick_and_morty/src/resources/characters/characters_repository.dart';
import 'package:rick_and_morty/src/resources/characters/response_model.dart';
import 'package:rick_and_morty/src/ui/screens/characters_screen/bloc/characters_event.dart';
import 'package:rick_and_morty/src/ui/screens/characters_screen/bloc/characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(InitialCharactersState()) {}

  @override
  Stream<CharactersState> mapEventToState(
    CharactersEvent event,
  ) async* {
    final currentState = state;
    if (event is ReachedListBottom && !_hasReachedBottom(currentState)) {
      try {
        if (currentState is InitialCharactersState) {
          final data = await _fetchCharacters(1);
          yield CharactersLoaded(
              characters: data.data,
              hasReachedBottom: !data.hasMore,
              nextPage: data.nextPage);
          return;
        }
        if (currentState is CharactersLoaded) {
          if (currentState.hasReachedBottom) {
            yield currentState;
          }
          final data = await _fetchCharacters(currentState.nextPage);
          yield CharactersLoaded(
              characters: currentState.characters + data.data,
              hasReachedBottom: !data.hasMore,
              nextPage: data.nextPage);
        }
      } catch (e, s) {
        print("$e, $s");
        yield CharactersError();
      }
    }
  }

  bool _hasReachedBottom(CharactersState state) =>
      state is CharactersLoaded && state.hasReachedBottom;

  Future<ResponseModel> _fetchCharacters(int page) async {
    var data;
    var response = await CharactersRepository().fetchCharacter(page);
    response.fold((l) => throw (ServerException), (r) => data = r);
    return data;
  }
}
