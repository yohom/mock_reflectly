import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/bloc/bloc.export.dart';
import 'package:mock_reflectly/src/di/injector.dart';
import 'package:mock_reflectly/src/models/bean.export.dart';
import 'package:mock_reflectly/src/resources/resource.export.dart';
import 'package:mock_reflectly/src/ui/screen/edit_story/edit_story.screen.dart';
import 'package:mock_reflectly/src/ui/screen/home/home.screen.dart';
import 'package:mock_reflectly/src/ui/screen/story_detail/story_detail.screen.dart';

class MockReflectlyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BLoCProvider<AppBLoC>(
      bloc: AppBLoC(),
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: _onGenerateRoute,
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
      ),
    );
  }
}

Route _onGenerateRoute(RouteSettings settings) {
  final routeInfo = parseJsonRoute(settings.name);

  switch (routeInfo.path) {
    // 登录, 是根目录'/'
    case RoutePath.home:
      return DecoratedRoute<HomeBLoC>(
        screen: HomeScreen(),
        bloc: Injector.obtain(),
        isInitialRoute: true,
        init: (bloc) => bloc.storyList.update(),
        routeName: routeInfo.path,
      );
    // 编辑Story
    case RoutePath.edit_story:
      return DecoratedRoute<EditStoryBLoC>(
        screen: EditStoryScreen(),
        bloc: Injector.obtain(),
        routeName: routeInfo.path,
      );
    // Story详情
    case RoutePath.story_detail:
      return DecoratedRoute<StoryDetailBLoC>(
        screen: StoryDetailScreen(),
        bloc: Injector.obtain(),
        init: (bloc) {
          bloc.data = Story.fromJson(routeInfo.arguments);
        },
        routeName: routeInfo.path,
      );
    default:
      return DecoratedRoute(screen: UnknownScreen(), routeName: routeInfo.path);
  }
}
