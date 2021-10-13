import 'package:rick_and_morty/src/models/location.dart';

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String image;
  final Location origin;
  final Location location;
  final String url;

  Character(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.image,
      required this.origin,
      required this.location,
      required this.url});

  Character.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        status = json['status'],
        species = json['species'],
        type = json['type'],
        image = json['image'],
        origin = Location.fromJson(json['origin']),
        location = Location.fromJson(json['location']),
        url = json['url'];
}
