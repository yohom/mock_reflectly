import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/resources/resource.export.dart';

class Avatar extends StatelessWidget {
  final double width;
  final double height;

  const Avatar({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadowedBox(
      shape: BoxShape.circle,
      width: width,
      height: height,
      shadowColor: Colors.black,
      shadowOffset: Offset(0.0, 12.0),
      spreadRadius: -12.0,
      blurRadius: 24.0,
      child: CircleAvatar(
        backgroundImage: AssetImage(D.faceGif),
      ),
    );
  }
}
