import 'package:bizhi/widgets/coins.dart';
import 'package:bizhi/widgets/profile/asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'profile/wallet.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final int connectStatus = 0; //  0: connected, 1: lose connect
  late TabController _tabController;
  final List<String> _tabList = [
    'Tab 1',
    'Tab 2',
    'Tab 3',
    'Tab 4',
    'Tab 5',
    'Tab 1',
    'Tab 2',
    'Tab 3',
    'Tab 4',
    'Tab 5'
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Expanded(
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.format_align_left,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    // MyPageRoute(child: MySecondPage()),
                    WalletPageRoute(child: WalletPage()),
                  );
                },
              ),
            ],
          ),
        ),
        title: Row(
          children: [
            _buildConnectStatusWidget(),
            const Expanded(child: SizedBox()),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.qr_code_scanner_outlined,
                color: Colors.black,
              ))
        ],
        // title: Text('Profile Page', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              // margin: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              // width: 200,
              // height: 100,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Current balance',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Text(
                          'USD',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // BalanceWidget(address: widget.address)
                        Text(1.2345.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              "f1jkzcn2xstealyngllhdjmeygrp6b5amvzhvklbi"
                                      .substring(0, 15) +
                                  '...',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.content_copy,
                                  color: Colors.white),
                              onPressed: () {
                                Clipboard.setData(ClipboardData(
                                    text:
                                        "f1jkzcn2xstealyngllhdjmeygrp6b5amvzhvklbi"));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Address copied')),
                                );
                              },
                            ),
                          ],
                        ),
                        Container(
                          width: 32,
                          height: 32,
                          child: IconButton(
                            iconSize: 28,
                            icon: Icon(Icons.qr_code, color: Colors.white),
                            onPressed: () {
                              _showWalletAddress();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              // width: MediaQuery.of(context).size.width / 1.3,
              width: double.infinity,
              // height: 30,
              // margin: EdgeInsets.symmetric(horizontal: 15),
              // margin: EdgeInsets.only(bottom: 40),
              decoration: BoxDecoration(
                // color: Color.fromRGBO(243, 195, 25, .55),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // 阴影颜色
                    spreadRadius: 2, // 扩散范围
                    blurRadius: 5, // 模糊程度
                    offset: Offset(0, 3), // 阴影偏移量
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Row(children: [
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          // 按钮点击事件处理
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.swipe_up_alt,
                              color: Colors.black,
                              size: 15,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Send',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent),
                      )),
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          // 按钮点击事件处理
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.swipe_down_alt,
                              color: Colors.black,
                              size: 15,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Receive',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent),
                      )),
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          // 按钮点击事件处理
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.black,
                              size: 15,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Sign',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent),
                      )),
                ]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 209, 208, 208),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              // margin: EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                  height: 100.0,
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                            onTap: () => {},
                            child: ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 80),
                                child: Card(
                                  color: Colors.transparent,
                                  elevation: 0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.favorite_border,
                                        size: 38,
                                      ),
                                      Text('Favorite'),
                                    ],
                                  ),
                                ))),
                  )),
            ),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: SizedBox(
                    height: 40,
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _tabList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Center(
                              child: Text(
                                _tabList[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: _currentIndex == index
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: _currentIndex == index
                                  ? Border(
                                      bottom: BorderSide(
                                      width: 1,
                                      color: Colors.black,
                                    ))
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => {},
                    )),
                // CoinsList()
              ],
            ),
            AssetList(items: [
              "1",
              "2",
            ]),
          ],
        ),
      )),
    );
  }

  @override
  Widget _buildFunctions(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 123,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Parent'),
                      ListView.builder(
                          itemCount: 2,
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Text('Child');
                          }),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  _showWalletAddress() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                // padding: const EdgeInsets.all(20),
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 20,
                  right: 20,
                ),
                child: QrImage(
                  data: "f1jkzcn2xstealyngllhdjmeygrp6b5amvzhvklbi",
                  size: 200,
                ),
              ),
              Container(
                color: Colors.grey[100],
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text("f1jkzcn2xstealyngllhdjmeygrp6b5amvzhvklbi"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextButton(
                          onPressed: () {
                            // TODO: save QR code to local
                          },
                          child: Text('Save QR Code'),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(
                                text:
                                    "f1jkzcn2xstealyngllhdjmeygrp6b5amvzhvklbi"));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Address copied')),
                            );
                          },
                          child: Text('Copy Address'),
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTab(String tab) {
    return Center(
      child: Text(
        tab,
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  Widget _buildConnectStatusWidget() {
    Color color = connectStatus == 0 ? Colors.green : Colors.red;
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
