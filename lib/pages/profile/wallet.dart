import 'package:bizhi/widgets/profile/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class Asseet {
  final String name;
  final double amount;
  bool selected = false;

  Asseet(this.name, this.amount);
}

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

class _WalletPageState extends State<WalletPage> {
  int _groupSelectedIndex = 0;
  int _accountSelectedIndex = 0;

  final double minHeightFraction = 1.0;
  final double maxHeightFraction = 1.0;

  late AnimationController animationController;

  List<Asseet> weightData = {
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
  }.entries.map((entry) => Asseet(entry.key, entry.value.toDouble())).toList();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: Navigator.of(context),
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.green[400],
        child: const Icon(Icons.add),
        elevation: maxHeightFraction * 0.1,
      ),
      body: AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget? child) {
          return Stack(
            children: [
              // 背景
              Container(
                color:
                    Colors.black.withOpacity(0.5 * animationController.value),
              ),
              // 弹出窗口
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: Tween<double>(
                  begin: MediaQuery.of(context).size.height * minHeightFraction,
                  end: MediaQuery.of(context).size.height * maxHeightFraction,
                )
                    .animate(CurvedAnimation(
                      parent: animationController,
                      curve: Curves.easeOut,
                      reverseCurve: Curves.easeIn,
                    ))
                    .value,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: new NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          // Expanded(child: Container( color: Colors.green[600],child: ,))
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(),
                                flex: 1,
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Wallets",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Container(
                                  // height: 500.0,
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                                flex: 1,
                              ),
                            ],
                          ),

                          // Divider(
                          //   color: Colors.grey,
                          // ),

                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Color.fromARGB(255, 122, 122, 122),
                                  width: 0.5,
                                ),
                              ),
                            ),
                            child: Expanded(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        color: Colors.grey[100],
                                        child: ListView.builder(
                                          // physics: ClampingScrollPhysics(),
                                          // shrinkWrap: true,
                                          itemCount: 25,
                                          itemBuilder: (BuildContext context,
                                                  int index) =>
                                              GestureDetector(
                                                  onTap: () => {
                                                        setState(() {
                                                          _groupSelectedIndex =
                                                              index;
                                                        })
                                                      },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 20),
                                                    color:
                                                        _groupSelectedIndex ==
                                                                index
                                                            ? Colors.white
                                                            : Colors
                                                                .transparent,
                                                    child: Container(
                                                      width: 26,
                                                      height: 26,
                                                      decoration: BoxDecoration(
                                                        color: _groupSelectedIndex ==
                                                                index
                                                            ? Colors.green
                                                            : Colors
                                                                .grey, // 根据isSelected设置圆形背景颜色
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(13),
                                                      ),
                                                      child: SvgPicture.asset(
                                                          'assets/logos/color/fil.svg',
                                                          allowDrawingOutsideViewBox:
                                                              true),

                                                      // Icon(
                                                      //   Icons
                                                      //       .check, // 您可以使用其他图标或自定义SVG图像
                                                      //   color: Colors
                                                      //       .white, // 设置图标颜色为白色
                                                      // ),
                                                    ),
                                                  )),
                                        ))),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      color: Colors.white,
                                      child: ListView.builder(
                                        // physics: ClampingScrollPhysics(),
                                        // shrinkWrap: true,
                                        itemCount: 25,
                                        itemBuilder: (BuildContext context, int index) => GestureDetector(
                                            onTap: () => {
                                                  setState(() {
                                                    _accountSelectedIndex =
                                                        index;
                                                  })
                                                },
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: Card(
                                                  child: Container(
                                                decoration:
                                                    _accountSelectedIndex ==
                                                            index
                                                        ? const BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          )
                                                        : const BoxDecoration(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    156,
                                                                    154,
                                                                    154),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                padding: EdgeInsets.all(10),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Fil-1',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        'f1jkzcn2xstealyngllhdjmeygrp6b5amvzhvklbi',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ),
                                                      SizedBox(
                                                        height: 6,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                              child:
                                                                  SizedBox()),
                                                          Text(
                                                            '5.21 FIL',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12),
                                                          ),
                                                        ],
                                                      )
                                                    ]),
                                              )),
                                            )

                                            // Container(
                                            //   alignment: Alignment.center,
                                            //   padding: EdgeInsets.symmetric(
                                            //       vertical: 20),
                                            //   color: _groupSelectedIndex ==
                                            //           index
                                            //       ? Colors.white
                                            //       : Colors.transparent,
                                            //   child: Container(
                                            //     width: 26,
                                            //     height: 26,
                                            //     decoration: BoxDecoration(
                                            //       color: _groupSelectedIndex ==
                                            //               index
                                            //           ? Colors.green
                                            //           : Colors
                                            //               .grey, // 根据isSelected设置圆形背景颜色
                                            //       borderRadius:
                                            //           BorderRadius.circular(
                                            //               13),
                                            //     ),
                                            //     child: SvgPicture.asset(
                                            //         'assets/logos/color/fil.svg',
                                            //         allowDrawingOutsideViewBox:
                                            //             true),

                                            //     // Icon(
                                            //     //   Icons
                                            //     //       .check, // 您可以使用其他图标或自定义SVG图像
                                            //     //   color: Colors
                                            //     //       .white, // 设置图标颜色为白色
                                            //     // ),
                                            //   ),
                                            // )
                                            ),
                                      )),
                                  // child: SingleChildScrollView(
                                  //     child: Container(
                                  //   child: WalletList(),
                                  // ))

                                  // Container(
                                  //     height:
                                  //         MediaQuery.of(context).size.height,
                                  //     // color: Colors.grey,
                                  //     child: ListView.builder(
                                  //       // physics: ClampingScrollPhysics(),
                                  //       // shrinkWrap: true,
                                  //       itemCount: 5,
                                  //       itemBuilder: (BuildContext context,
                                  //               int index) =>
                                  //           GestureDetector(
                                  //               onTap: () => {},
                                  //               child: ConstrainedBox(
                                  //                   constraints:
                                  //                       BoxConstraints(
                                  //                           minWidth: 80),
                                  //                   child: Card(
                                  //                     color:
                                  //                         Colors.transparent,
                                  //                     elevation: 0,
                                  //                     child: Column(
                                  //                       mainAxisAlignment:
                                  //                           MainAxisAlignment
                                  //                               .center,
                                  //                       children: [
                                  //                         Icon(
                                  //                           Icons
                                  //                               .favorite_border,
                                  //                           size: 38,
                                  //                         ),
                                  //                         Text('Favorite'),
                                  //                       ],
                                  //                     ),
                                  //                   ))),
                                  //     ))
                                ),
                              ],
                            )),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          );
        },
      ),
    );
  }
}

class WalletPageRoute extends PageRoute {
  final Widget child;
  WalletPageRoute({required this.child});

  @override
  Color? get barrierColor => Colors.black54;

  @override
  bool get opaque => false;

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
          .animate(animation),
      child: child,
    );
  }
}

class MyPageRoute extends PageRouteBuilder {
  final Widget child;

  MyPageRoute({required this.child})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return child;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
