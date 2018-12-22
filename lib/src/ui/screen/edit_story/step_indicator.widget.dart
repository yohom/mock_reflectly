import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/bloc/bloc.export.dart';

const kIndicatorSize = 32.0;

class StepIndicator extends StatelessWidget {
  const StepIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BLoCProvider.of<EditStoryBLoC>(context);
    return SafeArea(
      child: Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Padding(
          padding: const EdgeInsets.only(right: kSpaceBig),
          child: Column(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.keyboard_arrow_up, size: kIndicatorSize),
                color: Colors.white.withOpacity(0.4),
                onPressed: () =>
                    bloc.scrollPage.add(bloc.scrollPage.latest - 1),
              ),
              IconButton(
                icon: Icon(Icons.keyboard_arrow_down, size: kIndicatorSize),
                color: Colors.white,
                onPressed: () =>
                    bloc.scrollPage.add(bloc.scrollPage.latest + 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
