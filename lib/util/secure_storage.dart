import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureJsonStorage {
  // Private constructor for singleton
  SecureJsonStorage._privateConstructor();

  // Singleton instance
  static final SecureJsonStorage _instance = SecureJsonStorage._privateConstructor();

  // Factory constructor
  factory SecureJsonStorage() {
    return _instance;
  }

  // Instance of FlutterSecureStorage
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// Save JSON data securely
  Future<void> saveJson(String key, Map<String, dynamic> jsonData) async {
    final jsonString = json.encode(jsonData);
    await _storage.write(key: key, value: jsonString);
  }

  /// Read JSON data securely
  Future<Map<String, dynamic>?> readJson(String key) async {
    final jsonString = await _storage.read(key: key);
    if (jsonString == null) {
      return null;
    }
    return json.decode(jsonString) as Map<String, dynamic>;
  }

  /// Delete stored data by key
  Future<void> deleteJson(String key) async {
    await _storage.delete(key: key);
  }

  /// Check if a key exists
  Future<bool> containsKey(String key) async {
    final allKeys = await _storage.readAll();
    return allKeys.containsKey(key);
  }

  /// Clear all stored data
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}