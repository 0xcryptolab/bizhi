import 'dart:convert';
import 'package:bizhi/utils/secure_storeage.dart';
import 'package:hive/hive.dart';

const dbName = "keyBoxEncrypted";
List<int> dbKey = [];

Future<void> initKey() async {
  if (dbKey.isEmpty) {
    final StorageService _storageService = StorageService();

    final storedKey = await _storageService.readSecureData("hivedb_key");

    if (storedKey != null) {
      dbKey = base64Url.decode(storedKey);
    } else {
      dbKey = Hive.generateSecureKey();
      final encodedKey = base64UrlEncode(dbKey);
      // print(encodedKey);
      final StorageItem newItem = StorageItem("wallet_hivedb_key", encodedKey);
      _storageService.writeSecureData(newItem);
    }
  }
}

Future<void> dbInsert(dynamic key, dynamic value) async {
  await initKey();
  final encryptedBox =
      await Hive.openBox(dbName, encryptionCipher: HiveAesCipher(dbKey));
  encryptedBox.put(key, value);
  return;
}

Future<dynamic> dbGet(dynamic key) async {
  await initKey();
  final encryptedBox =
      await Hive.openBox(dbName, encryptionCipher: HiveAesCipher(dbKey));

  return encryptedBox.get(key);
}
