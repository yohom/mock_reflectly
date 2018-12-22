import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/ui/widget/fonted_text.dart';

/// story标题
class StoryTitle extends StatelessWidget {
  const StoryTitle(this._title, {Key key}) : super(key: key);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return QuicksandText(
      _title,
      style: Theme.of(context).textTheme.headline.copyWith(
            color: Colors.white.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
