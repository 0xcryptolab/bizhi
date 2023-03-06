abstract class Coin {
  String name;
  String abbreviation;
  List<dynamic> nodes;

  Coin({required this.name, required this.abbreviation, required this.nodes});

  void init();
  void send(String from, String to, double amount);
  double balance(String address);
  void receive(double amount);
}

class Coins {
  static Map<String, Coin> coins = {};

  static Future init() async {}
}
