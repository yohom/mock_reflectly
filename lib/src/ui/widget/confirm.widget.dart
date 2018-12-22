import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/ui/animation/fade_slide.transition.dart';

class Confirm extends StatelessWidget {
  final Widget child;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final double heightFactor;

  const Confirm({
    Key key,
    this.onCancel,
    this.heightFactor = 0.4,
    @required this.onConfirm,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FadeSlideTransition(
      duration: Duration(milliseconds: 500),
      slideCurve: Curves.elasticOut,
      slideReverseCurve: Curves.decelerate,
      originOffset: Offset(0.0, 100.0),
      builder: (context, controller) {
        return FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: heightFactor,
          child: Card(
            elevation: kElevationGiant,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              children: <Widget>[
                Flexible(child: child),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        if (onCancel != null) onCancel();
                        controller.reverse().then((_) => Router.pop(context));
                      },
                      child: Icon(Icons.close),
                    ),
                    FlatButton(onPressed: onConfirm, child: Icon(Icons.check)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
