import 'package:flutter/material.dart';

import '../../ui/tokenComponent.dart';
import '../../ui/widgetItems.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Homescreen();
  }
}

class _Homescreen extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                // header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.notifications_outlined),
                    Container(
                      width: 33,
                      height: 33,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          image: const DecorationImage(
                              image: AssetImage('assets/icons/user.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(40)),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Expanded(
                    child: SizedBox(
                        child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Wallet',
                        style: TextStyle(color: Colors.black54)),
                    const SizedBox(height: 5),
                    Row(children: const [
                      Text('Mobile Team',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800)),
                      SizedBox(
                        width: 3,
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.black38)
                    ]),

                    const SizedBox(height: 20),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 90,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: const [
                            WidgetItem(
                              icon: Icons.qr_code,
                              label: 'Your address',
                              isActive: true,
                            ),
                            WidgetItem(
                              icon: Icons.person,
                              label: 'Aliases',
                              isActive: false,
                            ),
                            WidgetItem(
                              icon: Icons.switch_right,
                              label: 'Balance',
                              isActive: false,
                            ),
                            WidgetItem(
                              icon: Icons.transfer_within_a_station,
                              label: 'Received',
                              isActive: false,
                            ),
                          ],
                        )),
                    const SizedBox(height: 20),
                    // tabs
                    Expanded(
                        child: DefaultTabController(
                            length: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PreferredSize(
                                    preferredSize:
                                        const Size.fromHeight(kToolbarHeight),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                            child: const TabBar(
                                          isScrollable: true,
                                          indicator: UnderlineTabIndicator(
                                              borderSide: BorderSide(
                                                width: 4.0,
                                                color: Colors.blue,
                                              ),
                                              insets: EdgeInsets.only(
                                                  left: 10, right: 40.0)),
                                          indicatorSize:
                                              TabBarIndicatorSize.tab,
                                          labelColor: Colors.black,
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          unselectedLabelStyle: TextStyle(
                                              fontWeight: FontWeight.normal),
                                          unselectedLabelColor: Colors.black38,
                                          labelPadding: EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          tabs: [
                                            Tab(
                                              text: 'Tokens',
                                            ),
                                            Tab(
                                              text: 'Lease',
                                            )
                                          ],
                                        )))),
                                const Expanded(
                                    child: TabBarView(
                                  children: [
                                    TokenComponent(),
                                    Center(child: Text('Nothing to show yet')),
                                  ],
                                )),
                              ],
                            ))),
                  ],
                )))
              ],
            )));
  }
}
