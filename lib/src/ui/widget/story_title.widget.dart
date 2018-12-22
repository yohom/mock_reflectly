import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/ui/widget/fonted_text.dart';

///
/// story标题
///
class StoryTitle extends StatelessWidget {
  const StoryTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return QuicksandText(
      title,
      style: Theme.of(context).textTheme.display1.copyWith(
            color: Colors.white.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
