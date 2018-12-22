import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/ui/widget/confirm.widget.dart';

class UpdateCover extends StatelessWidget {
  final String storyImage;

  const UpdateCover({Key key, this.storyImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Confirm(
      heightFactor: 0.7,
      onConfirm: () {},
      child: Column(
        children: <Widget>[
          Flexible(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: SizedBox.expand(
                    child: ImageWidget(imageUrl: storyImage),
                  ),
                ),
                SizedBox(
                  width: Global.screenHeight * 0.7,
                  height: 48.0,
                  child: RaisedButton(
                    elevation: kElevationBig,
                    color: Theme.of(context).buttonColor,
                    textColor: Colors.white,
                    onPressed: () {},
                    shape: StadiumBorder(),
                    child: Text('UPLOAD NEW COVER'),
                  ),
                ),
              ],
            ),
          ),
          SPACE_BIG,
          Text('OR CHOOSE FROM YOUR DAILY IMAGES'),
          SPACE_BIG,
        ],
      ),
    );
  }
}
