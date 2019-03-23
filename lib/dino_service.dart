
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:dino/dino_model.dart';

Future<String> _loadDinoAsset() async {
  return await rootBundle.loadString('assets/data/dinos.json');
}

Future<DinoList> loadDinos() async {
  print("loading dinos");
  String jsonDinos = await _loadDinoAsset();
  final jsonResponse = json.decode(jsonDinos);
  DinoList dinoList = DinoList.fromJson(jsonResponse['dinos']);
  return dinoList;
}