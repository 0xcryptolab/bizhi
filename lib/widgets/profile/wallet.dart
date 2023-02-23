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

class WalletList extends StatelessWidget {
  // final List<String> items;

  // WalletList({required this.items});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      // physics: ClampingScrollPhysics(),
      // physics: const NeverScrollableScrollPhysics(),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildAssets(assetData)
          // children: assetData.forEach((key, value) { }).,
          ),
    );
    // SingleChildScrollView(
    //     child: );
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
          child: Container(
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
          ),
        ),
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Fil-1',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'f1jkzcn2xstealyngllhdjmeygrp6b5amvzhvklbi',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Expanded(child: SizedBox()),
              Text(
                '5.21 FIL',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          )
        ]),
      )),
    );
  }
}
