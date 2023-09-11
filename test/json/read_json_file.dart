import 'dart:io';

Future<String> readJsonFile(String filePath) async {
  try {
    final file = File(filePath);
    final jsonString = await file.readAsString();
    return jsonString;
  } catch (e) {
    throw Exception("Error reading JSON file: $e");
  }
}