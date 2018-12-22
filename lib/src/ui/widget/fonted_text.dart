import 'package:flutter/material.dart';

class AvenirText extends StatelessWidget {
  const AvenirText(
    this.data, {
    Key key,
    this.style,
    this.textAlign,
    this.overflow,
  }) : super(key: key);

  final String data;
  final TextStyle style;
  final TextAlign textAlign;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      overflow: overflow,
      style: style.copyWith(fontFamily: 'Avenir'),
    );
  }
}

class QuicksandText extends StatelessWidget {
  final String data;
  final TextStyle style;
  final TextAlign textAlign;

  const QuicksandText(
    this.data, {
    Key key,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: style.copyWith(fontFamily: 'Quicksand'),
    );
  }
}
