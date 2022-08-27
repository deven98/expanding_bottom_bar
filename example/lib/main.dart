import 'package:expanding_bottom_bar/expanding_bottom_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var demoIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      bottomNavigationBar: ExpandingBottomBar(
        navBarHeight: 90.0,
        items: [
          ExpandingBottomBarItem(
            icon: Icons.bookmark_border,
            text: "Home",
            selectedColor: Colors.purple,
             heightBoxICon: 70
          ),
          ExpandingBottomBarItem(
            icon: Icons.favorite_border,
            text: "Likes",
            selectedColor: Colors.pink,
            heightBoxICon: 70
          ),
          ExpandingBottomBarItem(
            icon: Icons.search,
            text: "Search",
            selectedColor: Colors.amber,
             heightBoxICon: 70
          ),
          ExpandingBottomBarItem(
            icon: Icons.star_border,
            text: "Profile",
            selectedColor: Colors.teal,
             heightBoxICon: 70
          ),
        ],
        selectedIndex: demoIndex,
        onIndexChanged: (demo) {
          setState(() {
            demoIndex = demo;
          });
        },
      ),
    );
  }
}
