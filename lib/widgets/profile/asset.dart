import 'package:flutter/material.dart';

final Map<String, double> assetData = {
  'BTC': 100.0,
  'FIL': 10.0,
  'USDT': 111.123,
  'DESO': 123,
  'ERG': 1234,
  'RNDT': 1.111,
  'BTC1': 100.0,
  'FIL1': 10.0,
  'USDT1': 111.123,
  'DESO1': 123,
  'ERG1': 1234,
};

class AssetList extends StatelessWidget {
  final List<String> items;

  AssetList({required this.items});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: _buildAssets(assetData),
        // children: assetData.forEach((key, value) { }).,
      ),
    );
  }

  List<Widget> _buildAssets(Map<String, double> data) {
    List<Widget> cardList = [];
    data.forEach((key, value) {
      cardList.add(_buildAsset(key, value));
    });

    return cardList;
  }

  Widget _buildAsset(String name, double value) {
    return SizedBox(
      width: double.infinity,
      child: Card(
          child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(name),
          ),
          Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(value.toStringAsFixed(3)),
          ),
        ],
      )),
    );
  }
}
