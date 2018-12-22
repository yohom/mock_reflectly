import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/ui/widget/fonted_text.dart';

///
/// story日期
///
class StoryDate extends StatelessWidget {
  const StoryDate({
    Key key,
    @required this.storyDate,
  }) : super(key: key);

  final String storyDate;

  @override
  Widget build(BuildContext context) {
    return AvenirText(
      storyDate,
      style: Theme.of(context).textTheme.title.copyWith(
          color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.bold),
    );
  }
}
