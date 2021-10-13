import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/src/ui/screens/characters_screen/bloc/characters_bloc.dart';
import 'package:rick_and_morty/src/ui/screens/characters_screen/bloc/characters_event.dart';
import 'package:rick_and_morty/src/ui/screens/characters_screen/bloc/characters_state.dart';
import 'package:rick_and_morty/src/ui/screens/characters_screen/components/character_list_item.dart';
import 'package:rick_and_morty/src/ui/screens/characters_screen/components/custom_loader.dart';

class CharactersList extends StatefulWidget {
  @override
  _CharactersListState createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  final _listScrollController = ScrollController();

  late CharactersBloc _charactersBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      builder: (BuildContext context, state) {
        if (state is InitialCharactersState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is CharactersError) {
          return Center(
            child: Text("Couldn't load characters"),
          );
        }

        if (state is CharactersLoaded) {
          if (state.characters.isEmpty) {
            return Center(
              child: Text("Woops, couldn't find any characters!"),
            );
          }

          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 8.0,
            ),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              if (index >= state.characters.length) {
                if (!state.hasReachedBottom) {
                  return CustomLoader();
                } else {
                  return Center(
                    child: Text('Seems like you reached the end!'),
                  );
                }
              } else {
                return CharacterListItem(state.characters[index]);
              }
            },
            itemCount: 25, // Can change to state.characters.length + 1 for a full pagination experience,
            controller: _listScrollController,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void _onListScroll() {
    if (_listScrollController.offset >=
            _listScrollController.position.maxScrollExtent &&
        !_listScrollController.position.outOfRange) {
      _charactersBloc.add(ReachedListBottom());
    }
  }

  @override
  void initState() {
    _charactersBloc = BlocProvider.of<CharactersBloc>(context);
    _charactersBloc.add(ReachedListBottom());
    _listScrollController.addListener(_onListScroll);
    super.initState();
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    super.dispose();
  }
}
