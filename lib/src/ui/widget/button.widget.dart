import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final Gradient gradient;
  final Color color;

  const Button({Key key, this.gradient, this.color}) : super(key: key);

  @override
  _ButtonState createState() {
    return _ButtonState();
  }
}

class _ButtonState extends State<Button> {
  double _elevation = 0.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: _elevation,
      child: Container(
        decoration: BoxDecoration(
          gradient: widget.gradient,
          color: widget.color,
          borderRadius: BorderRadius.circular(45.0),
        ),
        child: Text('test'),
      ),
    );
  }
}
