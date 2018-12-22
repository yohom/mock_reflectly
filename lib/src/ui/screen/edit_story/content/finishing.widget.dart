import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/bloc/bloc.export.dart';
import 'package:mock_reflectly/src/ui/widget/bi_opeate.widget.dart';
import 'package:mock_reflectly/src/ui/widget/question.widget.dart';

const kQuestion =
    'Outstanding - another day, another story! Want to give it a catchy title?';
const kPositiveLabel = 'GET MY DAILY REFLECTION';
const kNegativeLabel = 'WAIT, I FORGOT SOMETHING!';
const kAddTitle = 'Add title...';
const kTitleOfTheDay = 'TITLE OF THE DAY';

const kInputContentPadding = EdgeInsets.symmetric(
  horizontal: kSpaceBig,
  vertical: kSpaceSmall,
);

class Finishing extends StatefulWidget {
  @override
  _FinishingState createState() {
    return _FinishingState();
  }
}

class _FinishingState extends State<Finishing> {
  int _textCount = 0;

  @override
  Widget build(BuildContext context) {
    final bloc = BLoCProvider.of<EditStoryBLoC>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(height: 96.0),
        Question(kQuestion),
        TextField(
          onChanged: (text) {
            setState(() => _textCount = text.length);
          },
          cursorColor: Colors.white70,
          cursorWidth: 1.0,
          style: Theme.of(context)
              .textTheme
              .headline
              .copyWith(color: Colors.white70),
          decoration: InputDecoration(
            counterText: '$_textCount / 40',
            helperText: 'TITLE OF THE DAY',
            helperStyle: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: Colors.white30),
            contentPadding: kInputContentPadding,
            border: InputBorder.none,
            hintText: kAddTitle,
            hintStyle: Theme.of(context)
                .textTheme
                .headline
                .copyWith(color: Colors.white70, fontFamily: 'Avenir'),
          ),
        ),
        BiOperate(
          positiveLabel: kPositiveLabel,
          negativeLabel: kNegativeLabel,
          onPositivePressed: () {},
          onNegativePressed: () {
            bloc.scrollPage.add(bloc.scrollPage.latest - 1);
          },
        ),
      ],
    );
  }
}
