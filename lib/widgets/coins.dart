import 'package:bizhi/models/coin/coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// List<Currency> coins = [];

final testCoins = [
  const Currency(
    name: 'Bitcoin',
    logo: 'btc',
    price: 63000.0,
    percentage24: 2.5,
    balance: 100.0,
    priceHistory: [62000.0, 63000.0, 64000.0],
    balanceHistory: [98.0, 99.0, 100.0],
  ),
  const Currency(
    name: 'Ethereum',
    logo: 'eth',
    price: 2000.0,
    percentage24: 1.0,
    balance: 200.0,
    priceHistory: [1950.0, 1975.0, 2000.0],
    balanceHistory: [198.0, 199.0, 200.0],
  ),
  const Currency(
    name: 'Ripple',
    logo: 'xrp',
    price: 0.5,
    percentage24: 3.0,
    balance: 300.0,
    priceHistory: [0.49, 0.495, 0.5],
    balanceHistory: [298.0, 299.0, 300.0],
  ),
  const Currency(
    name: 'Bitcoin Cash',
    logo: 'bch',
    price: 500.0,
    percentage24: 2.0,
    balance: 400.0,
    priceHistory: [490.0, 495.0, 500.0],
    balanceHistory: [398.0, 399.0, 400.0],
  ),
  const Currency(
    name: 'Litecoin',
    logo: 'ltc',
    price: 200.0,
    percentage24: 4.0,
    balance: 500.0,
    priceHistory: [195.0, 198.0, 200.0],
    balanceHistory: [498.0, 499.0, 500.0],
  ),
  const Currency(
    name: 'Cardano',
    logo: 'ada',
    price: 1.5,
    percentage24: 3.0,
    balance: 600.0,
    priceHistory: [1.49, 1.495, 1.5],
    balanceHistory: [598.0, 599.0, 600.0],
  ),
  const Currency(
    name: 'Chainlink',
    logo: 'link',
    price: 30.0,
    percentage24: 5.0,
    balance: 700.0,
    priceHistory: [29.0, 29.5, 30.0],
    balanceHistory: [698.0, 699.0, 700.0],
  ),
  const Currency(
    name: 'Litecoin',
    logo: 'ltc',
    price: 200.0,
    percentage24: 4.0,
    balance: 500.0,
    priceHistory: [195.0, 198.0, 200.0],
    balanceHistory: [498.0, 499.0, 500.0],
  ),
  const Currency(
    name: 'Cardano',
    logo: 'ada',
    price: 1.5,
    percentage24: 3.0,
    balance: 600.0,
    priceHistory: [1.49, 1.495, 1.5],
    balanceHistory: [598.0, 599.0, 600.0],
  ),
  const Currency(
    name: 'Chainlink',
    logo: 'link',
    price: 30.0,
    percentage24: 5.0,
    balance: 700.0,
    priceHistory: [29.0, 29.5, 30.0],
    balanceHistory: [698.0, 699.0, 700.0],
  ),
  const Currency(
    name: 'Litecoin',
    logo: 'ltc',
    price: 200.0,
    percentage24: 4.0,
    balance: 500.0,
    priceHistory: [195.0, 198.0, 200.0],
    balanceHistory: [498.0, 499.0, 500.0],
  ),
  const Currency(
    name: 'Cardano',
    logo: 'ada',
    price: 1.5,
    percentage24: 3.0,
    balance: 600.0,
    priceHistory: [1.49, 1.495, 1.5],
    balanceHistory: [598.0, 599.0, 600.0],
  ),
  const Currency(
    name: 'Chainlink',
    logo: 'link',
    price: 30.0,
    percentage24: 5.0,
    balance: 700.0,
    priceHistory: [29.0, 29.5, 30.0],
    balanceHistory: [698.0, 699.0, 700.0],
  ),
  const Currency(
    name: 'Litecoin',
    logo: 'ltc',
    price: 200.0,
    percentage24: 4.0,
    balance: 500.0,
    priceHistory: [195.0, 198.0, 200.0],
    balanceHistory: [498.0, 499.0, 500.0],
  ),
  const Currency(
    name: 'Cardano',
    logo: 'ada',
    price: 1.5,
    percentage24: 3.0,
    balance: 600.0,
    priceHistory: [1.49, 1.495, 1.5],
    balanceHistory: [598.0, 599.0, 600.0],
  ),
  const Currency(
    name: 'Chainlink',
    logo: 'link',
    price: 30.0,
    percentage24: 5.0,
    balance: 700.0,
    priceHistory: [29.0, 29.5, 30.0],
    balanceHistory: [698.0, 699.0, 700.0],
  ),
];

enum SortState {
  DEFAULT,
  DESCENDING,
  ASCENDING,
}

class CoinsList extends StatefulWidget {
  const CoinsList({super.key});

  @override
  State<CoinsList> createState() => _CoinsListState();
}

class _CoinsListState extends State<CoinsList> {
  SortState _sortState = SortState.DEFAULT;
  List<Currency> _coins = testCoins;
  final List<Currency> _coinsBak = testCoins;

  double getProfitRatio(Currency coin) {
    double totalCost = 0;
    double totalBalance = 0;
    for (int i = 0; i < coin.priceHistory.length; i++) {
      totalCost += coin.priceHistory[i] * coin.balanceHistory[i];
      totalBalance += coin.balanceHistory[i];
    }
    print(coin.name);
    print(totalBalance);
    return totalCost / totalBalance / coin.price - 1;
  }

  @override
  Widget build(BuildContext context) {
    switch (_sortState) {
      case SortState.DESCENDING:
        _coins.sort((a, b) => b.price.compareTo(a.price));
        break;
      case SortState.ASCENDING:
        _coins.sort((a, b) => a.price.compareTo(b.price));
        break;
      default:
        _coins = _coinsBak;
    }

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
            ),
            Expanded(
              child: Text('Coins'),
            ),
            SizedBox(
              width: 100,
            ),
            Expanded(
              child: Text('24h Change'),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    switch (_sortState) {
                      case SortState.DEFAULT:
                        _sortState = SortState.ASCENDING;
                        break;
                      case SortState.DESCENDING:
                        _sortState = SortState.ASCENDING;
                        break;
                      case SortState.ASCENDING:
                        _sortState = SortState.DEFAULT;
                        break;
                    }
                  });
                },
                child: Text('Profit Ratio'),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: _coins.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/logos/color/${_coins[index].logo.toLowerCase()}.svg',
                    allowDrawingOutsideViewBox: true,
                  ),
                  title: Text(_coins[index].name),
                  subtitle: Text('Price: \$${_coins[index].price}'),
                  trailing: Wrap(
                    spacing: 50, // space between two icons
                    children: <Widget>[
                      Expanded(
                          flex: 3,
                          child: Text('${_coins[index].percentage24}%')),
                      Expanded(
                          flex: 3,
                          child: Text('${_coins[index].percentage24}%')),
                      // Text('${_coins[index].percentage24}%'),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Expanded(child: Text('${_coins[index].percentage24}%')),
                  //     Expanded(child: Text('${_coins[index].percentage24}%')),
                  //   ],
                  // ),

                  // Row(
                  //   children: [

                  //     // Text('${_coins[index].percentage24}%'),
                  //     // Text('${getProfitRatio(_coins[index])}%'),
                  //   ],
                  // )
                ),
              );
            },
          ),
        ),
        // ListView.builder(
        //   itemCount: _coins.length,
        //   itemBuilder: (context, index) {
        //     return Card(
        //       child: ListTile(
        //         leading: SvgPicture.asset(
        //           'assets/logos/color/${_coins[index].logo.toLowerCase()}.svg',
        //         ),
        //         title: Text(_coins[index].name),
        //         subtitle: Text('Price: \$${_coins[index].price}'),
        //         trailing: Text('24h Change: ${_coins[index].percentage24}%'),
        //       ),
        //     );
        //   },
        // )
      ],
    );
  }
}
