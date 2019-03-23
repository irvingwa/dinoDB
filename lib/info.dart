import 'package:dino/dino_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_tts/flutter_tts.dart';

class InfoScreen extends StatelessWidget {
  final Dino dino;
  final FlutterTts flutterTts = new FlutterTts();
  var _talking = false;

  // In the constructor, require a Todo
  InfoScreen({Key key, @required this.dino}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var images = [];
    for (var img in dino.images) {
      images.add(new AssetImage(img));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(dino.name),
      ),
      body: new ListView(children: <Widget>[
        new SizedBox(
            height: MediaQuery.of(context).size.width * 0.5,
            width: MediaQuery.of(context).size.width * 0.5,
            child: new Carousel(
              autoplay: false,
              images: images,
            )),
        new Container(
            padding: const EdgeInsets.all(32.0),
            child: new Text(
              dino.description,
              softWrap: true,
            ))
      ]),
      floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.volume_up),
          backgroundColor: Colors.purple,
          onPressed: () {
            if (!_talking) {
              _talking = true;
              flutterTts.speak(dino.description);
            }
            else {
              _talking = false;
              flutterTts.stop();
            }
          }),
    );
  }
}
