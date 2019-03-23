class Dino {
  final String name;
  final String description;
  List<dynamic> images;

  Dino({this.name, this.description, this.images});

  factory Dino.fromJson(Map<String, dynamic> json) {
    return new Dino(
      name: json['name'],
      description: json['description'],
      images: json['images'],
    );
  }
}

class DinoList {
  final List<Dino> dinos;

  DinoList({
    this.dinos,
  });



  factory DinoList.fromJson(List<dynamic> parsedJson) {
    List<Dino> dinos = new List<Dino>();
    dinos = parsedJson.map((i) => Dino.fromJson(i)).toList();

    return new DinoList(
      dinos: dinos,
    );
  }
}
