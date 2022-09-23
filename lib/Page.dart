
import 'package:example_bottom_bar/MainScreen.dart';
import 'package:example_bottom_bar/ProfileSettings.dart';
import 'package:flutter/material.dart';

import 'Settings.dart';


class PageWithBottomBar extends StatefulWidget {


  PageWithBottomBar({
    Key? key
  }) : super(key: key);



  @override
  State<PageWithBottomBar> createState() => _PageWithBottomBarState();
}

class _PageWithBottomBarState extends State<PageWithBottomBar> {
  int currentIndex = 0;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  Map <int,String> routeIndex = {
    0:"/main",
    1:"/settings",
    2:"/settings/profile"
  };

  @override
  Widget build(BuildContext context) {
    var bottomNavBar =  BottomNavigationBar(
      currentIndex: currentIndex,
      type : BottomNavigationBarType.fixed,
      onTap: (index){
        _navigatorKey.currentState!.pushNamed(routeIndex[index]!);
        /*if (index==0){
          _navigatorKey.currentState!.pushNamed(routeIndex[index]!);
        }
        else if (index==1){
          _navigatorKey.currentState!.pushNamed(routeIndex[index]!);
        }
        else {
          _navigatorKey.currentState!.pushNamed(routeIndex[index]!);
        }*/

        setState(() {
          if (index==2) currentIndex = 1;
          else currentIndex = index;
        });
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text("Trying bottom bar")),
      bottomNavigationBar: bottomNavBar,
      body: Navigator(
        key: _navigatorKey,
        onGenerateRoute: (settings){
          Widget widget =MainScreen();
          if (settings.name == "/main"){
            currentIndex = 0;
            widget = MainScreen();
          } else if (settings.name == "/settings"){
            currentIndex = 1;
            widget = Settings();
          }
          else if (settings.name == "/settings/profile"){
            currentIndex = 2;
            widget = ProfileSettings();
          }
          return MaterialPageRoute(builder: (context)=> widget,settings: settings);
        },
        initialRoute: "/main",
      ),
    );
  }
}