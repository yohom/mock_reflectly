import 'dart:io';

import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/bloc/bloc.export.dart';
import 'package:mock_reflectly/src/ui/screen/story_detail/content.widget.dart';
import 'package:mock_reflectly/src/ui/screen/story_detail/operate_group/operate_gourp.widget.dart';
import 'package:mock_reflectly/src/ui/screen/story_detail/summary.widget.dart';

class StoryDetailScreen extends StatefulWidget {
  const StoryDetailScreen({Key key}) : super(key: key);

  @override
  _StoryDetailScreenState createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  final _controller = ScrollController();

  double _parallaxOffset = 0.0;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() => _parallaxOffset = -_controller.offset * 0.2);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BLoCProvider.of<StoryDetailBLoC>(context);
    return WillPopScope(
      // 禁掉ios的滑动退出
      onWillPop: () async => !Platform.isIOS,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Hero(
              tag: bloc.data.title,
              child: Transform.translate(
                offset: Offset(0.0, _parallaxOffset),
                child: SizedBox.expand(
                  child: ImageWidget(imageUrl: bloc.data.storyImage),
                ),
              ),
            ),
            ListView(
              controller: _controller,
              children: <Widget>[
                SizedBox(height: Global.screenHeight * 0.65),
                SizedBox(
                  height: Global.screenHeight * 0.18,
                  child: Summary(),
                ),
                SPACE_BIG,
                Content(),
              ],
            ),
            OperateGroup(),
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
