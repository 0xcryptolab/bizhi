class Wallet {
  String name;
  String address;
  String? privateKey;
  String coin;

  Wallet({required this.name, required this.address, required this.coin});
}

class WalletGroup {
  List<Wallet> wallets = [];
}
