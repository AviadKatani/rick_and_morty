import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/src/models/character.dart';
import 'package:rick_and_morty/src/models/location.dart';
import 'package:rick_and_morty/src/ui/screens/detailed_character_screen/bloc/detailed_character_bloc.dart';
import 'package:rick_and_morty/src/ui/screens/detailed_character_screen/bloc/detailed_character_event.dart';
import 'package:rick_and_morty/src/ui/screens/detailed_character_screen/bloc/detailed_character_state.dart';
import 'package:rick_and_morty/src/ui/screens/detailed_character_screen/components/detailed_status_widget.dart';
import 'package:rick_and_morty/src/ui/screens/detailed_character_screen/components/location_widget.dart';
import 'package:rick_and_morty/src/ui/screens/detailed_character_screen/components/stroked_text.dart';
import 'package:rick_and_morty/src/ui/theme.dart';

class DetailedCharacterScreen extends StatefulWidget {
  final Character character;
  final online;

  const DetailedCharacterScreen(
      {Key? key, required this.character, this.online})
      : super(key: key);

  @override
  _DetailedCharacterScreenState createState() =>
      _DetailedCharacterScreenState();
}

class _DetailedCharacterScreenState extends State<DetailedCharacterScreen> {
  late DetailedCharacterBloc _detailedCharacterBloc;

  @override
  void initState() {
    _detailedCharacterBloc = BlocProvider.of<DetailedCharacterBloc>(context);
    _detailedCharacterBloc.add(FetchingLocation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSilverAppBar(),
          _buildSilverBody(),
        ],
      ),
    );
  }

  Widget _buildSilverAppBar() {
    return SliverAppBar(
      title: StrokedText(widget.character.name),
      expandedHeight: 300,
      flexibleSpace: Hero(
        tag: widget.character.image,
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(widget.character.image),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSilverBody() {
    return BlocBuilder<DetailedCharacterBloc, DetailedCharacterState>(
      builder: (BuildContext context, state) {
        if (state is InitialDetailedCharacterState) {
          return SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is DetailedCharacterError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text("Couldn't fetch data"),
            ),
          );
        }

        if (state is DetailedCharacterLoaded) {
          return _buildBody(state.locationsData);
        }

        return SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget _buildBody(Map<String, Location> locationsData) {
    Location? origin = locationsData['originData'];
    Location? location = locationsData['locationData'];
    return SliverToBoxAdapter(
      child: Container(
        height: MediaQuery.of(context).size.height / 1.7,
        width: MediaQuery.of(context).size.width - 30,
        margin: EdgeInsets.only(top: 50, left: 15.0, right: 15.0, bottom: 10),
        decoration: BoxDecoration(
          color: kContainerColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Text(
                    widget.character.name.toUpperCase(),
                    style: kDetailedName,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            DetailedStatusWidget(status: widget.character.status),
            const SizedBox(
              height: 20,
            ),
            LocationWidget(location),
            const SizedBox(
              height: 20,
            ),
            LocationWidget(origin, isOrigin: true),
          ],
        ),
      ),
    );
  }
}
