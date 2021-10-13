import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/ui/screens/characters_screen/components/characters_list.dart';
import 'package:rick_and_morty/src/ui/screens/characters_screen/components/custom_app_bar.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: CharactersList(),
    );
  }
}
