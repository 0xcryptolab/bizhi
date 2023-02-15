import 'package:bizhi/pages/View.dart';
import 'package:bizhi/pages/analytic.dart';
import 'package:bizhi/pages/discovery.dart';
import 'package:bizhi/pages/market.dart';
import 'package:bizhi/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:pixelarticons/pixelarticons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bizhi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Bizhi'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  int _selectedIndex = 0;

  List<Widget> pages = [
    MarketPage(),
    AnalyticPage(),
    DiscoveryPage(),
    ViewPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/logo_360.png",
          // scale: 5,
          height: 20,
        ),
        title: Text(
          widget.title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.black, fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Pixel.search, color: Colors.black54),
              Text("Search crypto infos...",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.w800,
                      )),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
              icon: const Icon(
                // Icons.notifications_outlined,
                Pixel.notification,
                color: Colors.black,
              ),
              onPressed: () {}),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: PageView(
        onPageChanged: (index) => setState(() {
          _selectedIndex = index;
        }),
        controller: _pageController,
        children: [...pages],
      ),
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linearToEaseOut,
        selectedIndex: _selectedIndex,
        iconSize: 30,
        showElevation: false, // use this to remove appBar's elevation
        onItemSelected: (index) => _onItemTapped(index),
        items: [
          FlashyTabBarItem(
            icon: const Icon(Pixel.analytics),
            title: const Text('Analysis'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.local_convenience_store_outlined),
            title: const Text('Market'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.explore_outlined),
            title: const Text('Discovery'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.newspaper_outlined),
            title: const Text('Views'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.person_outline),
            title: const Text('Me'),
          ),
        ],
      ),
    );
  }
}
