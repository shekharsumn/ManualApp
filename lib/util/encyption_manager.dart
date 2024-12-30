import 'dart:io';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:path_provider/path_provider.dart';

class EncryptionManager {
  // Private constructor for singleton
  EncryptionManager._privateConstructor();

  // Singleton instance
  static final EncryptionManager _instance = EncryptionManager._privateConstructor();

  // Factory constructor
  factory EncryptionManager() {
    return _instance;
  }

  // Encryption key and IV (Initialization Vector)
  // final _key = encrypt.Key.fromLength(32); // Use a secure 32-byte key
  final _iv = encrypt.IV.fromLength(16); // Use a secure 16-byte IV
  final _encrypter = encrypt.Encrypter(encrypt.AES(encrypt.Key.fromLength(32)));

  /// Encrypts a JSON string
  String encryptJson(String jsonString) {
    final encrypted = _encrypter.encrypt(jsonString, iv: _iv);
    return encrypted.base64;
  }

  /// Decrypts an encrypted JSON string
  String decryptJson(String encryptedJson) {
    final decrypted = _encrypter.decrypt64(encryptedJson, iv: _iv);
    return decrypted;
  }

  /// Saves the encrypted JSON string to a file
  Future<void> saveEncryptedJsonToFile(String fileName, String jsonString) async {
    final encryptedData = encryptJson(jsonString);
    final path = await _getFilePath(fileName);
    final file = File(path);
    await file.writeAsString(encryptedData);
  }

  /// Reads and decrypts the JSON string from a file
  Future<String> readEncryptedJsonFromFile(String fileName) async {
    final path = await _getFilePath(fileName);
    final file = File(path);

    if (await file.exists()) {
      final encryptedData = await file.readAsString();
      return decryptJson(encryptedData);
    } else {
      throw Exception('File not found: $fileName');
    }
  }

  /// Gets the file path in the app's documents directory
  Future<String> _getFilePath(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$fileName';
  }
}