import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/src/ui/screens/characters_screen/bloc/characters_bloc.dart';
import 'package:rick_and_morty/src/ui/screens/characters_screen/characters_screen.dart';
import 'package:rick_and_morty/src/ui/theme.dart';

void main() {
  runApp(BlocProvider(
      create: (BuildContext context) => CharactersBloc(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: kAppPrimaryColor
      ),
      home: const CharactersScreen(),
    );
  }
}
