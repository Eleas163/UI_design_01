import 'package:flutter/material.dart';

class FavouritesWidget extends StatefulWidget {
  @override
  _FavouritesWidgetState createState() => _FavouritesWidgetState();
}

class _FavouritesWidgetState extends State<FavouritesWidget>{
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(child: Text('Favourites')),

    );
  }
}