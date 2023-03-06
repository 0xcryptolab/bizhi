import 'package:bizhi/utils/hivedb.dart';

class Fil {
  static String name = "Filecoin";
  static List<dynamic> rpcs = [];
  static int rpcSelected = 0;

  static Future init() async {
    final rpcs = db_all("${name}_rpcs");
  }
}

late Fil coin;
