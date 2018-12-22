import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/ui/widget/fonted_text.dart';

/// Page的第一页
class Intro extends StatelessWidget {
  const Intro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SPACE_GIANT,
        AvenirText(
          'Your \nStories',
          style: Theme.of(context).textTheme.display1.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 36.0,
              ),
        ),
        SPACE_HUGE,
        _Divider(),
        SPACE_HUGE,
        Text(
          'FILTER STORIES',
          style: TextStyle(color: Colors.grey),
        ),
        SPACE_BIG,
        Text(
          '# Favorites',
          style: Theme.of(context).textTheme.subhead,
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.0,
      height: 2.0,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.6),
        borderRadius: BorderRadius.circular(45.0),
      ),
    );
  }
}
