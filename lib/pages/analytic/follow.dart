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
        indicatorColor: Colors.black,
        indicatorWeight: 2.0,
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Stack(
  //     children: <Widget>[
  //       Positioned(
  //         left: 0,
  //         right: 0,
  //         top: 0,
  //         bottom: 0,
  //         child: buildTableViewWidget(),
  //       ),
  //       Positioned(
  //         left: 0,
  //         right: 0,
  //         bottom: 0,
  //         top: 30,
  //         child: buildTabBarWidget(),
  //       ),
  //     ],
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TabBar(
          controller: _tabController,
          // indicatorColor: Colors.transparent,
          // indicator: BoxDecoration(
          //   borderRadius: BorderRadius.circular(
          //     8.0,
          //   ),
          //   color: Colors.green[400],
          // ),
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.black54,
          isScrollable: true,
          tabs: _tabWidgetList,
        ),
        Container(
          // height: screenHeight * 0.70,
          height: 20,
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.blueGrey[300],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.blueGrey[300],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
