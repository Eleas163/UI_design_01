import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final _tabPages = <Widget>[
      FindWidget(),
      FavouritesWidget(),
      MessagesWidget(),
      HomeWidget()
    ];
    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Find')),
      BottomNavigationBarItem(icon: Icon(Icons.star_border), title: Text('Favourites')),
      BottomNavigationBarItem(icon: Icon(Icons.sms), title: Text('Messages')),
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home'))
    ];
    assert(_tabPages.length  == _bottomNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: _bottomNavBarItems,
      currentIndex: _currentIndex,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black,
      onTap: (int index) {
        setState(() {
          try {

          } catch (e) {
            print("Error Loading Settings: $e");
          }
          _currentIndex = index;
        });
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus =FocusScope.of(context);

            if(!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
        child: _tabPages[_currentIndex]),
      ),
      bottomNavigationBar: bottomNavBar,

    );
  }
}