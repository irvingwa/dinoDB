import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  final String dinoName;

  // In the constructor, require a Todo
  InfoScreen({Key key, @required this.dinoName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(dinoName),
        ),
        body: new ListView(children: <Widget>[
          new Image.network(
              "http://images.dinosaurpictures.org/Microraptor_gui_d734.jpg"),
          new Container(
              padding: const EdgeInsets.all(32.0),
              child: new Text(
                "Microraptor was a carnivore. It lived in the Cretaceous period and inhabited Asia. Its fossils have been found in places such as Inner Mongolia (China) and Liaoning (China).",
                softWrap: true,
              ))
        ]));
  }
}
