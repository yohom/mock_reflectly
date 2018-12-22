import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/resources/resource.export.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({Key key}) : super(key: key);

  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar>
    with TickerProviderStateMixin {
  TabController _controller;

  Color _writeColor = Colors.black;
  Color _listenColor = Colors.grey;
  Color _mineColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this)
      ..addListener(() {
        if (!_controller.indexIsChanging) {
          setState(() {
            switch (_controller.index) {
              case 0:
                _writeColor = Colors.black;
                _listenColor = Colors.grey;
                _mineColor = Colors.grey;
                break;
              case 1:
                _writeColor = Colors.grey;
                _listenColor = Colors.black;
                _mineColor = Colors.grey;
                break;
              case 2:
                _writeColor = Colors.grey;
                _listenColor = Colors.grey;
                _mineColor = Colors.black;
                break;
              default:
                break;
            }
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return ShadowedBox(
      blurRadius: 12.0,
      spreadRadius: -4.0,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(8.0),
        bottom: Radius.circular(Global.isIphoneX ? 40.0 : 8.0),
      ),
      child: SafeArea(
        top: false,
        child: TabBar(
          controller: _controller,
          indicator: DotTabIndicator(offset: 3 / 4),
          tabs: [
            IconButton(
              padding: EdgeInsets.all(20),
              icon: Icon(D.write, color: _writeColor),
              onPressed: () => _controller.animateTo(0),
            ),
            IconButton(
              padding: EdgeInsets.all(20),
              icon: Icon(D.listen, color: _listenColor),
              onPressed: () => _controller.animateTo(1),
            ),
            IconButton(
              padding: EdgeInsets.all(20),
              icon: Icon(D.mine, color: _mineColor),
              onPressed: () => _controller.animateTo(2),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
