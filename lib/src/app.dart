import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/bloc/bloc.export.dart';
import 'package:mock_reflectly/src/resources/colors.dart';
import 'package:mock_reflectly/src/ui/screen/home/home.screen.dart';

class MockReflectlyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BLoCProvider<AppBLoC>(
      bloc: AppBLoC(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: kBackgroundColor,
          primaryColor: kColorPrimary,
          primaryColorDark: kColorPrimaryDark,
          buttonColor: kButtonColor,
          sliderTheme: SliderThemeData(
            activeTrackColor: Colors.white,
            inactiveTrackColor: Color(0xff6869a9),
            disabledActiveTrackColor: Colors.red,
            disabledInactiveTrackColor: Colors.red,
            activeTickMarkColor: Colors.transparent,
            inactiveTickMarkColor: Colors.transparent,
            disabledActiveTickMarkColor: Colors.red,
            disabledInactiveTickMarkColor: Colors.red,
            thumbColor: Colors.white,
            disabledThumbColor: Colors.white,
            overlayColor: Colors.white.withOpacity(0.3),
            valueIndicatorColor: Colors.blue,
            thumbShape: RoundSliderThumbShape(),
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            showValueIndicator: ShowValueIndicator.never,
            valueIndicatorTextStyle: TextStyle(),
          ),
        ),
        home: Builder(
          builder: (context) {
            Global.init(context);
            return HomeScreen();
          },
        ),
      ),
    );
  }
}
