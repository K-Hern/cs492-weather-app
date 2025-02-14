import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final dirPath = await _localPath;
  final path = "$dirPath/WeatherSettings.json";

  final file = File(path);
  if (!(await file.exists())) {
    await file.create();
    await file.writeAsString(jsonEncode({"Saved Locations": []}));
  }

  return file;
}

Future<Map<String, dynamic>> readFile() async {
  try {
    final file = await _localFile;

    // Read the file
    final contents = await file.readAsString();
    return jsonDecode(contents);

  } catch (e) {
    print("Error reading file: $e");
    return {"Saved Locations": []};
  }
}

Future<File> writeFile(String newCity, String state, String zip) async {
  final file = await _localFile;

  // Read existing contents
  Map<String, dynamic> contents = await readFile();

  // Add new location
  contents["Saved Locations"].add([newCity, state, zip]);

  // Write updated data back to the file
  return file.writeAsString(jsonEncode(contents));
}
