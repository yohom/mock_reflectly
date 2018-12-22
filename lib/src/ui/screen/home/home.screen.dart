import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/ui/screen/home/bottom_tab_bar.widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
//          IndexScreen(),
          BottomTabBar(),
        ],
      ),
    );
  }
}
