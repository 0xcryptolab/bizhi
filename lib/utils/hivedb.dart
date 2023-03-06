import 'package:hive/hive.dart';

const dbName = "keyBox";
Future<void> db_insert(dynamic key, dynamic value, String? name) async {
  final db = name ?? dbName;
  final encryptedBox = await Hive.openBox(
    db,
  );
  encryptedBox.put(key, value);
  return;
}

Future<dynamic> db_get(dynamic key, String? name) async {
  final db = name ?? dbName;
  final encryptedBox = await Hive.openBox(
    db,
  );

  return encryptedBox.get(key);
}

Future<dynamic> db_all(String? name) async {
  final db = name ?? dbName;
  final encryptedBox = await Hive.openBox(
    db,
  );
  final outList = encryptedBox.values;
  await encryptedBox.close();

  return outList;
}
