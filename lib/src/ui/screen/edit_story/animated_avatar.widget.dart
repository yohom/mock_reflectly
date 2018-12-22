import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/bloc/bloc.export.dart';
import 'package:mock_reflectly/src/ui/animation/show_up.transition.dart';
import 'package:mock_reflectly/src/ui/screen/edit_story/edit_story.screen.dart';
import 'package:mock_reflectly/src/ui/widget/avatar.widget.dart';

class AnimatedAvatar extends StatelessWidget {
  const AnimatedAvatar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BLoCProvider.of<EditStoryBLoC>(context);
    return StreamBuilder(
      stream: bloc.scrollPage.stream,
      initialData: 0,
      builder: (_, ss) {
        // 是否C位
        final isCPosition = ss.data == 0 || ss.data == 5;
        return AnimatedContainer(
          duration: kPageChangeDuration,
          curve: Curves.ease,
          margin: EdgeInsets.only(
            top: isCPosition ? kSpaceGiant : kSpaceHuge,
            left: isCPosition ? 0.0 : kSpaceHuge,
          ),
          alignment: isCPosition
              ? AlignmentDirectional.topCenter
              : AlignmentDirectional.topStart,
          transform: Matrix4.identity()..scale(isCPosition ? 1.0 : 0.7),
          child: ShowUpTransition(child: Avatar(width: 80.0, height: 80.0)),
        );
      },
    );
  }
}
