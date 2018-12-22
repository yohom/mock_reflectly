import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/resources/resource.export.dart';
import 'package:mock_reflectly/src/ui/widget/fonted_text.dart';

class NewStory extends StatelessWidget {
  const NewStory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RoutePath.edit_story),
      child: ShadowedBox(
        borderRadius: BorderRadius.circular(Dimens.cardRadius),
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

class _Background extends StatelessWidget {
  const _Background({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: NEW_STORY_CARD_TO_EDIT_STORY,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.cardRadius),
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

class _Action extends StatelessWidget {
  const _Action({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(D.addNewStory, color: Colors.white, size: 100.0),
        SPACE_BIG,
        AvenirText(
          S.addNewStory,
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
