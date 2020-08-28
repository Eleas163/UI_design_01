import 'package:flutter/material.dart';

import './screens/screens.dart';

void main() => runApp(UiDesign());

class UiDesign extends StatefulWidget {
  @override
  _UiDesignState createState() => _UiDesignState();
}

class _UiDesignState extends State<UiDesign> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          //DetailsScreen.routeName: (ctx) => DetailsScreen(),

        });
  }
}