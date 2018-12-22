import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/ui/widget/fonted_text.dart';

class Question extends StatelessWidget {
  final String question;

  const Question(this.question, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(left: kSpaceBig),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: QuicksandText(
            question,
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
