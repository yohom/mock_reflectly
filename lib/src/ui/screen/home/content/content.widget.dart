import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/ui/screen/home/content/back_to_index.widget.dart';
import 'package:mock_reflectly/src/ui/widget/avatar.widget.dart';

class Content extends StatelessWidget {
  const Content({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SPACE_NORMAL,
              SafeArea(child: Avatar(width: 48.0, height: 48.0)),
              SPACE_HUGE,
//              Flexible(child: Stories(bloc: BlocProvider.of(context))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: BackToIndex(),
          ),
        ],
      ),
    );
  }
}
