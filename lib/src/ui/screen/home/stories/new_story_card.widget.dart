import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/resources/resource.export.dart';
import 'package:mock_reflectly/src/ui/widget/fonted_text.dart';

const kCardRadius = 12.0;

class NewStoryCard extends StatelessWidget {
  const NewStoryCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
//      onTap: () => Router.navigate(context, EditStoryScreen()),
      child: ShadowedBox(
        borderRadius: BorderRadius.circular(kCardRadius),
        spreadRadius: -16.0,
        blurRadius: 24.0,
        shadowColor: Theme.of(context).primaryColor,
        shadowOffset: Offset(0.0, 24.0),
        margin: EdgeInsets.only(
          bottom: 106,
          left: kSpaceNormal,
          right: kSpaceNormal,
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          fit: StackFit.expand,
          children: <Widget>[
            _Background(),
            D.newEntryBg,
            _Action(),
          ],
        ),
      ),
    );
  }
}

/// 背景
class _Background extends StatelessWidget {
  const _Background({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'NEW_STORY_CARD_TO_EDIT_STORY',
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kCardRadius),
          gradient: LinearGradient(
            colors: [kGradientStartColor, kGradientEndColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}

/// 新增story的图标和文字
class _Action extends StatelessWidget {
  const _Action({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          D.addNewStory,
          color: Colors.white,
          size: 100.0,
        ),
        SPACE_BIG,
        AvenirText(
          'ADD NEW STORY',
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
