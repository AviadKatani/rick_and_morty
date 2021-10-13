class Location {
  final String name;
  final String type;
  final String dimension;
  final String url;

  Location(
      {this.name = '', this.type = '', this.dimension = '', required this.url});

  Location.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        type = json['type'] ?? '',
        dimension = json['dimension'] ?? '',
        url = json['url'];
}
