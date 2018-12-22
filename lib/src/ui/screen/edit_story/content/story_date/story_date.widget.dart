import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/bloc/bloc.export.dart';
import 'package:mock_reflectly/src/ui/animation/fade_slide.transition.dart';
import 'package:mock_reflectly/src/ui/animation/show_up.transition.dart';
import 'package:mock_reflectly/src/ui/screen/edit_story/content/story_date/select_date.widget.dart';
import 'package:mock_reflectly/src/ui/widget/fonted_text.dart';
import 'package:mock_reflectly/src/utils/times.dart';

/// 日期
class StoryDate extends StatelessWidget {
  const StoryDate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(width: 80.0, height: 80.0),
        _Greeting(),
        SelectDate(),
        _LetsDoIt(),
      ],
    );
  }
}

class _Greeting extends StatelessWidget {
  const _Greeting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: FadeSlideTransition(
        delay: Duration(milliseconds: 300),
        builder: (context, controller) {
          return QuicksandText(
            'Good ${Times.currentPeriod()} yohom, ready to create a new story?',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(color: Colors.white70),
          );
        },
      ),
    );
  }
}

class _LetsDoIt extends StatelessWidget {
  _LetsDoIt();

  factory _LetsDoIt.forDesignTime() => _LetsDoIt();

  @override
  Widget build(BuildContext context) {
    final bloc = BLoCProvider.of<EditStoryBLoC>(context);
    final theme = Theme.of(context);
    return ShowUpTransition(
      delay: 1300,
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: RaisedButton(
          elevation: kElevationBig,
          padding: EdgeInsets.symmetric(vertical: kSpaceBig),
          onPressed: () {
            bloc.scrollPage.add(1);
          },
          shape: StadiumBorder(),
          color: Colors.white,
          child: Text(
            'LETS DO IT!',
            style: theme.textTheme.subhead.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.buttonColor,
            ),
          ),
        ),
      ),
    );
  }
}
