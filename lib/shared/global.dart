import 'package:bizhi/utils/hivedb.dart';

class RpcNode {
  RpcNode(this.url, this.key);
  final String url;
  final String key;
}

class Global {
  // Rpc list
  static List<RpcNode> rpcs = [];
  // Rpc selected
  static int rpcIdx = 0;

  // init global data at starting time
  static Future init() async {
    final rpcList = db_all("wallet_rpcs");
  }
}
