import 'package:dino/dino_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:dino/info.dart';
import 'package:dino/dino_service.dart';

main() async => {
      runApp(
        MyApp(),
      )
    };

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _items = [];
  DinoList _dinoList;

  @override
  void initState() {
    super.initState();
    List<String> dinoNames = [];
    loadDinos().then((dinoList) {
      dinoList.dinos.forEach((d) => {
            dinoNames.add(d.name),
          });
      setState(() {
        print("set state");
        _dinoList = dinoList;
        _items = dinoNames;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_dinoList == null) {
      return new Container();
    }
    return MaterialApp(
      home: Scaffold(
        body: new Stack(children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.5,
              child: TypeAheadField<String>(
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a Dinosaurs Name'),
                ),
                suggestionsCallback: (String pattern) async {
                  return _items
                      .where((item) =>
                          item.toLowerCase().startsWith(pattern.toLowerCase()))
                      .toList();
                },
                itemBuilder: (context, String dinoName) {
                  return ListTile(
                    title: Text(dinoName),
                  );
                },
                onSuggestionSelected: (String dinoName) {
                  var retDino;

                  for (var dino in _dinoList.dinos) {
                    if (dino.name == dinoName) {
                      retDino = dino;
                      break;
                    }
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InfoScreen(
                              dino: retDino,
                            )),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
