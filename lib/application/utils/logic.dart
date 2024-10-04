import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

String generateNonRepeatingAlphanumeric(int length) {
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();

  if (length > characters.length) {
    throw ArgumentError('Length must not exceed the number of available characters.');
  }

  final result = <String>{}; // Use a set to keep track of used characters
  while (result.length < length) {
    final index = random.nextInt(characters.length);
    result.add(characters[index]);
  }

  return result.join('');
}

String? isEmptyValidation(String? value) {
  if (value?.isEmpty == true) {
    return 'This field is required';
  }
  return null;
}

Future<void> saveString(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

Future<String?> getString(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

Future<void> saveBool(String key, bool value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, value);
}

Future<bool?> getBool(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key);
}
