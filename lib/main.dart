import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:dino/info.dart';

void main() => runApp(MyApp());

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
  List<String> items = [
    "Apple",
    "Armidillo",
    "Actual",
    "Actuary",
    "America",
    "Argentina",
    "Australia",
    "Antarctica",
    "Blueberry",
    "Cheese",
    "Apple",
    "Armidillo",
    "Actual",
    "Actuary",
    "America",
    "Argentina",
    "Australia",
    "Antarctica",
    "Blueberry",
    "Cheese"
  ];

  @override
  Widget build(BuildContext context) {
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
                  return items
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoScreen(dinoName: dinoName,)),
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
