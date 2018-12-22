import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';

///
/// 关闭按钮
///
class Close extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;

  const Close({
    Key key,
    this.color = Colors.white30,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: AlignmentDirectional.topEnd,
        child: IconButton(
          padding: EdgeInsets.only(right: kSpaceHuge, top: kSpaceBig),
          icon: Icon(
            Icons.close,
            color: color,
            size: 36.0,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
