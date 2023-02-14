import 'package:bizhi/widgets/coins.dart';
import 'package:flutter/material.dart';

class FollowPage extends StatefulWidget {
  const FollowPage({super.key});
  @override
  State<FollowPage> createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage>
    with SingleTickerProviderStateMixin {
  static const List<String> _tabTextList = [
    "Default Group",
    "Invest",
    "Quant",
    "Small Cap",
    "Kol"
  ];

  final List<Tab> _tabWidgetList = [];

  late TabController _tabController;
  @override
  void initState() {
    super.initState();

    for (var value in _tabTextList) {
      _tabWidgetList.add(Tab(
        child: Text(
          value,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ));
    }

    _tabController = TabController(vsync: this, length: _tabTextList.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  buildTableViewWidget() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: _tabTextList
          .map((value) => Container(
                alignment: Alignment.center,
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.black),
                ),
              ))
          .toList(),
    );
  }

  buildTabBarWidget() {
    return Container(
      alignment: Alignment.topCenter,
      child: TabBar(
        controller: _tabController,
        tabs: _tabWidgetList,
        labelColor: Colors.black,
        indicatorColor: Colors.green[500],
        indicatorWeight: 2.0,
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 84,
            bottom: 0,
            child: CoinsList(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 38,
            child: buildTabBarWidget(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.green[400],
        child: const Icon(Icons.add),
      ),
    );
  }
}
