import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/ui/screen/home/back_to_index.widget.dart';
import 'package:mock_reflectly/src/ui/screen/home/bottom_tab_bar.widget.dart';
import 'package:mock_reflectly/src/ui/screen/home/stories/stories.widget.dart';
import 'package:mock_reflectly/src/ui/widget/avatar.widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          DecoratedColumn(
            color: Theme.of(context).backgroundColor,
            children: <Widget>[
              SPACE_NORMAL,
              SafeArea(child: Avatar(width: 48.0, height: 48.0)),
              SPACE_HUGE,
              Flexible(child: Stories()),
            ],
          ),
          BottomTabBar(),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: BackToIndex(),
          ),
        ],
      ),
    );
  }
}
