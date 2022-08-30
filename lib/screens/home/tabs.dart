import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getask/Common/colors.dart';
import 'package:getask/screens/home/homescreen.dart';
import 'package:getask/ui/bottomsheet.dart';

import '../../ui/addBottomSheet.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Tab();
  }
}

class _Tab extends State<Tabs> {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  int currentTab = 0;

  void onItemTap(int index) {
    if (index == 2) {
      _openBottomSheet();
    } else {
      setState(() {
        currentTab = index;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Widget tabIcon({icon}) {
    return Icon(icon, size: 25);
  }

  Widget tabActiveIcon({icon}) {
    return Icon(icon, size: 25, color: CustomColor.PrimaryColor);
  }

  _openBottomSheet() {
    bottomSheetPopUp(
      ctx: context,
      height: MediaQuery.of(context).size.height * 0.70,
      child: Scaffold(
          body: Container(
              color: const Color.fromARGB(255, 33, 80, 200),
              width: MediaQuery.of(context).size.width * 100,
              child: const AddBottomSheet())),
    );
  }

  @override
  Widget build(BuildContext context) {
    int backbuttonpressedTime = 0;

    final List<Widget> tabList = <Widget>[
      const Homescreen(),
      const Center(child: Text('Coming soon 2')),
      const Center(child: Text('Coming soon 3')),
      const Center(child: Text('Coming soon 4')),
      Container(),
    ];

    return WillPopScope(
        onWillPop: () async {
          const snackBar = SnackBar(
            content: Text(
              'Tap back again to leave',
            ),
          );
          var currentTime = DateTime.now().millisecondsSinceEpoch;

          if (currentTime - backbuttonpressedTime <
              const Duration(seconds: 2).inMilliseconds) {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            return false;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            backbuttonpressedTime = currentTime;
            return false;
          }
        },
        child: Scaffold(
          body: tabList.elementAt(currentTab),

          // drawerScrimColor: Colors.transparent,

          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: tabIcon(icon: Icons.wallet_outlined),
                activeIcon: tabActiveIcon(
                  icon: Icons.wallet,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: tabIcon(icon: Icons.directions_outlined),
                activeIcon: tabActiveIcon(
                  icon: Icons.directions,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.black38.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Icon(
                      Icons.add,
                    )),
                activeIcon: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: CustomColor.PrimaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4)),
                    child:
                        const Icon(Icons.add, color: CustomColor.PrimaryColor)),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: tabIcon(icon: Icons.list_outlined),
                activeIcon: tabActiveIcon(
                  icon: Icons.list,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: tabIcon(icon: Icons.settings_outlined),
                activeIcon: tabActiveIcon(
                  icon: Icons.settings,
                ),
                label: '',
              ),
            ],
            // currentIndex: _selectedIndex,
            currentIndex: currentTab,
            backgroundColor: Colors.white,
            iconSize: 18,
            onTap: onItemTap,
            selectedFontSize: 14.0,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            unselectedFontSize: 14.0,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: CustomColor.PrimaryColor,
            unselectedItemColor: CustomColor.grey9,
            unselectedLabelStyle: const TextStyle(
              color: CustomColor.grey9,
            ),
          ),
        ));
  }
}
