import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/bloc/bloc.export.dart';
import 'package:mock_reflectly/src/ui/widget/mood.widget.dart';
import 'package:mock_reflectly/src/ui/widget/story_date.widget.dart';
import 'package:mock_reflectly/src/ui/widget/story_title.widget.dart';

/// 概要
class Summary extends StatelessWidget {
  const Summary({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BLoCProvider.of<StoryDetailBLoC>(context).data;
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(kSpaceBig),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StoryDate(storyDate: data.storyDate),
              StoryTitle(data.title),
            ],
          ),
        ),
        Positioned(
          right: -kSpaceHuge,
          child: Mood(size: 120.0),
        ),
      ],
    );
  }
}
