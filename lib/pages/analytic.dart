import 'package:bizhi/pages/analytic/follow.dart';
import 'package:flutter/material.dart';

class AnalyticPage extends StatefulWidget {
  const AnalyticPage({super.key});
  @override
  State<AnalyticPage> createState() => _AnalyticPageState();
}

class _AnalyticPageState extends State<AnalyticPage>
    with SingleTickerProviderStateMixin {
  static const List<String> _tabTextList = [
    "Follow",
    "Market Cap",
    "Futures",
    "Options",
    "Notifications"
  ];
  static const List<Widget> _pages = [];

  List<Tab> _tabWidgetList = [];

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
        // text: value,
      ));
    }

    _tabController = TabController(vsync: this, length: _tabTextList.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildTabContent(String tabName) {
    switch (tabName) {
      case "Follow":
        return const FollowPage();
      default:
        return Container(
          alignment: Alignment.center,
          child: Text(
            tabName,
            style: const TextStyle(color: Colors.black),
          ),
        );
    }
  }

  buildTableViewWidget() {
    return TabBarView(
      controller: _tabController,
      children: _tabTextList.map((value) => buildTabContent(value)).toList(),
    );
  }

  buildTabBarWidget() {
    return Container(
      alignment: Alignment.topCenter,
      child: TabBar(
        controller: _tabController,
        tabs: _tabWidgetList,
        labelColor: Colors.green[900],
        unselectedLabelColor: Colors.black,
        // indicatorColor: Colors.black,
        indicatorColor: Colors.transparent,
        indicatorWeight: 2.0,
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: buildTableViewWidget(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: buildTabBarWidget(),
          ),
        ],
      ),
    );
  }
}
