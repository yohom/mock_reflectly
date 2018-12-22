import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/bloc/bloc.export.dart';
import 'package:mock_reflectly/src/resources/resource.export.dart';
import 'package:mock_reflectly/src/ui/screen/edit_story/edit_story.screen.dart';
import 'package:mock_reflectly/src/ui/screen/edit_story/thing.widget.dart';
import 'package:mock_reflectly/src/ui/widget/question.widget.dart';

const kReallyTerrible = 'Okay - what make today really teririble?';
const kSomewhatBad = 'Sorry about that - what made today somewhat bad?';
const kCompletelyOk = 'Cool - what made today completely okay?';
const kPrettyGood = 'Great - what made today pretty good?';
const kSuperAwesome = 'Amazing - what made today super awesome?';

const kWork = 'Work';
const kFamily = 'Family';
const kRelationship = 'Relationship';
const kEducation = 'Education';
const kFood = 'Food';
const kTravelling = 'Travelling';
const kFriends = 'Friends';
const kExercise = 'Exercise';
const kOther = 'Other';

class WhatMadeToday extends StatelessWidget {
  const WhatMadeToday({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BLoCProvider.of<EditStoryBLoC>(context);
    return Column(
      children: <Widget>[
        kTopMargin,
        StreamBuilder<double>(
          stream: bloc.howWasYourDay.stream,
          initialData: 5.0,
          builder: (_, ss) {
            String question = kCompletelyOk;
            if (ss.data == 0.0) {
              question = kReallyTerrible;
            } else if (ss.data == 2.5) {
              question = kSomewhatBad;
            } else if (ss.data == 5.0) {
              question = kCompletelyOk;
            } else if (ss.data == 7.5) {
              question = kPrettyGood;
            } else if (ss.data == 10.0) {
              question = kSuperAwesome;
            }
            return Question(question);
          },
        ),
        Flexible(child: _ThingMadeToday()),
        SPACE_GIANT,
      ],
    );
  }
}

class _ThingMadeToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        padding: EdgeInsets.symmetric(
          vertical: kSpaceHuge,
          horizontal: kSpaceBig,
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        childAspectRatio: 1.3,
        children: <Widget>[
          Thing(D.work, title: kWork),
          Thing(D.family, title: kFamily),
          Thing(D.relationship, title: kRelationship),
          Thing(D.education, title: kEducation),
          Thing(D.food, title: kFood),
          Thing(D.travelling, title: kTravelling),
          Thing(D.friends, title: kFriends),
          Thing(D.exercise, title: kExercise),
          Thing(D.other, title: kOther, color: Colors.black26),
        ],
      ),
    );
  }
}
