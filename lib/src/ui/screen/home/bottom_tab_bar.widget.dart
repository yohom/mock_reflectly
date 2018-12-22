import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/resources/resource.export.dart';
import 'package:rxdart/rxdart.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({Key key}) : super(key: key);

  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar>
    with TickerProviderStateMixin {
  TabController _controller;
  Subject<int> _subject;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _subject = BehaviorSubject()..listen(_controller.animateTo);
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
            _Tab(subject: _subject, index: 0, icon: D.write),
            _Tab(subject: _subject, index: 1, icon: D.listen),
            _Tab(subject: _subject, index: 2, icon: D.mine),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _subject.close();
    super.dispose();
  }
}

class _Tab extends StatelessWidget {
  const _Tab({
    Key key,
    @required Subject<int> subject,
    @required int index,
    @required IconData icon,
  })  : _subject = subject,
        _index = index,
        _icon = icon,
        super(key: key);

  final Subject<int> _subject;
  final int _index;
  final IconData _icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(20),
      icon: StreamBuilder<int>(
        stream: _subject.stream,
        initialData: 0,
        builder: (context, ss) => Icon(
              _icon,
              color: ss.data == _index ? Colors.black : Colors.grey,
            ),
      ),
      onPressed: () => _subject.add(_index),
    );
  }
}
