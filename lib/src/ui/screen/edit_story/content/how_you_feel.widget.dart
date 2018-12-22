import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/resources/resource.export.dart';
import 'package:mock_reflectly/src/ui/screen/edit_story/edit_story.screen.dart';
import 'package:mock_reflectly/src/ui/widget/fonted_text.dart';
import 'package:mock_reflectly/src/ui/widget/question.widget.dart';

final kIconDataList = [
  {D.happy: 'Happy'},
  {D.blessed: 'Blessed'},
  {D.lucky: 'Lucky'},
  {D.good: 'Good'},
  {D.confused: 'Confused'},
  {D.stressed: 'Stressed'},
  {D.angry: 'Angry'},
  {D.anxious: 'Anxious'},
  {D.down: 'Down'},
];
const kQuestion = 'How did you fell throughout the day?';

class HowYouFeel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        kTopMargin,
        Question(kQuestion),
        Flexible(child: _Feel()),
        SPACE_GIANT,
      ],
    );
  }
}

class _Feel extends StatefulWidget {
  @override
  _FeelState createState() {
    return _FeelState();
  }
}

class _FeelState extends State<_Feel> {
  final _controller = PageController(viewportFraction: 0.35);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: kIconDataList.length,
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            double iconFactor = 1.0;
            double labelFactor = 1.0;
            if (_controller.position.haveDimensions) {
              iconFactor = _controller.page - index;
              iconFactor = (1 - (iconFactor.abs() * .6)).clamp(0.4, 1.0);

              labelFactor = _controller.page - index;
              labelFactor = (1 - labelFactor.abs()).clamp(0.0, 1.0);
            } else if (index == 1) {
              // 如果是首次加载, 由于haveDimensions为false, 会导致index为1处的item
              // 的value也会是1, 这里手动调整一下value.
              iconFactor = 0.5;
              labelFactor = 0.0;
            }

            return Transform.scale(
              scale: Curves.easeOut.transform(iconFactor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    kIconDataList[index].keys.toList()[0],
                    size: 80.0,
                    color: Colors.white.withOpacity(iconFactor),
                  ),
                  SPACE_BIG,
                  QuicksandText(
                    kIconDataList[index].values.toList()[0],
                    style: TextStyle(
                      color: Colors.white.withOpacity(labelFactor),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
