import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/src/models/character.dart';
import 'package:rick_and_morty/src/ui/screens/detailed_character_screen/bloc/detailed_character_bloc.dart';
import 'package:rick_and_morty/src/ui/screens/detailed_character_screen/detailed_character_screen.dart';
import 'package:rick_and_morty/src/ui/theme.dart';

class CharacterListItem extends StatelessWidget {
  final Character character;

  const CharacterListItem(this.character);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                  create: (BuildContext context) =>
                      DetailedCharacterBloc(character: character),
                  child: DetailedCharacterScreen(character: character))),
        );
      },
      child: Stack(
        children: <Widget>[
          Container(
            height: 150.0,
            margin: EdgeInsets.only(left: 46.0),
            decoration: BoxDecoration(
              color: kContainerColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(105.0, 16.0, 16.0, 16.0),
              constraints: BoxConstraints.expand(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    character.name,
                    overflow: TextOverflow.ellipsis,
                    style: kCharacterItemTextStyle,
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: <Widget>[
                      character.status == "Alive"
                          ? Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                            )
                          : Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            ),
                      SizedBox(width: 5),
                      Text(character.status, style: kStatusTextStyle),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: FractionalOffset.centerLeft,
            child: Hero(
              tag: character.image,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  character.image,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
