import 'package:flutter/material.dart';

import '../models/models.dart';

class FindWidget extends StatefulWidget {
  @override
  _FindWidgetState createState() => _FindWidgetState();
}

class _FindWidgetState extends State<FindWidget>{
  int _currentIndex = 0;
  String _catMenuSelectedItem;

  @override
  Widget build(BuildContext context) {
    var mediaQuerySize = MediaQuery.of(context).size;

    final _menuTabPages = <Widget>[
      Center(child: Text('Menu 1'),),
      Center(child: Text('Menu 2'),),
      Center(child: Text('Menu 3'),),
    ];

    final _menuTabs = <Tab>[
      Tab(text: 'Menu 1',),
      Tab(text: 'Menu 2',),
      Tab(text: 'Menu 3',),
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(mediaQuerySize.height*.2),
          child: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(color: Colors.grey.withOpacity(1)),
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5) ,
              //height: mediaQuerySize.height*.2,
              //width: mediaQuerySize.width,
              child: Column(
                children: <Widget>[
                  _labelRow(),
                  _searchRow(mediaQuerySize),
                ],
              ),
            ),
            bottom: PreferredSize(
              child: Container(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: TabBar(
                  indicator: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white
                  ),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.white,
                    tabs: _menuTabs,),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: _menuTabPages,
        ),
      ),
    );
  }

  Widget _labelRow () {
  return Padding(
    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Text('Select Category', textAlign: TextAlign.left, style: TextStyle(fontSize: 15),),
    Text('Search', textAlign: TextAlign.right,style: TextStyle(fontSize: 15))
    ],
    ),
  );
  }

  Widget _searchRow(var mediaQuerySize) {
    return Padding(padding: EdgeInsets.only(top: 10),
    child : Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Container(
    padding: EdgeInsets.only(left: 10),
    height: mediaQuerySize.height*.05,
    width: mediaQuerySize.width*.43,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    border: Border.all(width: 0.5),
    color: Colors.white
    ),
    child: _categoryDropDownMenu(),
    ),
    Container(
    padding: EdgeInsets.only(left: 10),
    height: mediaQuerySize.height*.05,
    width: mediaQuerySize.width*.43,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    border: Border.all(width: 0.5),
    color: Colors.white
    ),
    child: TextFormField(
    autocorrect: false,
    obscureText: false,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      border: InputBorder.none,
    hintText: 'Enter Keyword'
    ),
    ),
    ),]
    ),
    );
  }

  Widget _categoryDropDownMenu () {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: _catMenuSelectedItem,
        hint: Text('Choose'),
        items: catMenuItems.map(
                (String val) => DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                )).toList(),
        onChanged: ((String newVal) {
          setState(() {
            _catMenuSelectedItem = newVal;
          });
        }),
      ),
    );
  }
  

}