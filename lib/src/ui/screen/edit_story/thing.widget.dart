import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/bloc/bloc.export.dart';
import 'package:mock_reflectly/src/ui/widget/fonted_text.dart';

class Thing extends StatelessWidget {
  final IconData iconData;
  final String title;

  final Color color;

  const Thing(
    this.iconData, {
    Key key,
    @required this.title,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BLoCProvider.of<EditStoryBLoC>(context);
    return GestureDetector(
      onTapUp: (detail) => bloc.whatMadeToday.add(title),
      child: StreamBuilder<String>(
        stream: bloc.whatMadeToday.stream,
        builder: (_, ss) {
          final selected = ss.data == title;
          return selected
              ? ShadowedBox(
                  borderRadius: BorderRadius.circular(8.0),
                  spreadRadius: -8.0,
                  child: _Content(
                    iconData: iconData,
                    selected: selected,
                    color: color,
                    title: title,
                  ),
                )
              : _Content(
                  iconData: iconData,
                  selected: selected,
                  color: color,
                  title: title,
                );
        },
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key key,
    @required this.iconData,
    @required this.selected,
    @required this.color,
    @required this.title,
  }) : super(key: key);

  final IconData iconData;
  final bool selected;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          color: selected ? primaryColor : color,
          size: 32.0,
        ),
        SPACE_NORMAL,
        AvenirText(
          title,
          style: Theme.of(context).textTheme.subhead.copyWith(
                color: selected ? primaryColor : Colors.white.withOpacity(0.6),
              ),
        ),
      ],
    );
  }
}
