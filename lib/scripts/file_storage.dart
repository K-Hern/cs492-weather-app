import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/WeatherSettings.json');
}

Future<Map<String, dynamic>> readFile() async {
  final file = await _localFile;

  // Read the file
  final contents = await file.readAsString();

  return jsonDecode(contents);
}

Future<File> writeFile(String newCity, String state, String zip) async {
  final file = await _localFile;

  Map<String, dynamic> contents = await readFile();

  contents["Saved Locations"].append([newCity, state, zip]);

  // Write the file
  return file.writeAsString(jsonEncode(contents));
}