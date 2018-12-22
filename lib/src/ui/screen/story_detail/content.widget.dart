import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/resources/resource.export.dart';
import 'package:mock_reflectly/src/ui/animation/fade_slide.transition.dart';
import 'package:mock_reflectly/src/ui/widget/fonted_text.dart';

/// 内容
class Content extends StatelessWidget {
  const Content({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleTheme =
        Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.bold);
    final contentTheme =
        Theme.of(context).textTheme.subhead.copyWith(color: Colors.grey);

    return FadeSlideTransition(
      originOffset: Offset(0.0, 200.0),
      delay: Duration(microseconds: 600),
      builder: (_, __) {
        return ShadowedBox(
          spreadRadius: -8.0,
          borderRadius: BorderRadius.circular(24.0),
          margin: EdgeInsets.all(kSpaceZero),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kSpaceLarge,
              vertical: kSpaceLarge,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _VisualHandle(),
                SPACE_HUGE,
                AvenirText('WHAT HAPPENED TODAY?', style: titleTheme),
                SPACE_BIG,
                AvenirText('啊啊啊', style: contentTheme),
                SPACE_GIANT,
                AvenirText(
                    'WHAT 3 THINGS WOULD YOU TAKE WITH YOU ON A DESERTED ISLAND?',
                    style: titleTheme),
                SPACE_BIG,
                AvenirText('的', style: contentTheme),
                SPACE_GIANT,
                AvenirText('YOUR DAILY NOTES', style: titleTheme),
                SPACE_BIG,
                AvenirText('hahahahahha', style: contentTheme),
                SPACE_GIANT,
                AvenirText('IMAGE OF THE DAY', style: titleTheme),
                SPACE_BIG,
                _AddImage(),
                SPACE_HUGE,
              ],
            ),
          ),
        );
      },
    );
  }
}

/// 视觉上的句柄, 就是那个短杠
class _VisualHandle extends StatelessWidget {
  const _VisualHandle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.center,
      heightFactor: 4.0,
      child: Container(
        height: 6.0,
        width: 64.0,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(45.0),
        ),
      ),
    );
  }
}

/// 新增照片
class _AddImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 150.0,
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            D.addImage,
            size: 36.0,
            color: Colors.grey.withOpacity(0.5),
          ),
          SPACE_BIG,
          AvenirText('ADD IMAGE',
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.grey.withOpacity(0.7))),
        ],
      ),
    );
  }
}
