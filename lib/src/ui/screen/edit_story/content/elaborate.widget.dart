import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/bloc/bloc.export.dart';
import 'package:mock_reflectly/src/ui/screen/edit_story/edit_story.screen.dart';
import 'package:mock_reflectly/src/ui/widget/bi_opeate.widget.dart';
import 'package:mock_reflectly/src/ui/widget/question.widget.dart';

const kQuestion = 'Would you like to elaborate on what happended?';

class Elaborate extends StatelessWidget {
  const Elaborate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BLoCProvider.of<EditStoryBLoC>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        kTopMargin,
        Question(kQuestion),
        Flexible(
          child: BiOperate(
            onPositivePressed: () {},
            onNegativePressed: () {
              bloc.scrollPage.add(bloc.scrollPage.latest + 1);
            },
          ),
        ),
      ],
    );
  }
}
