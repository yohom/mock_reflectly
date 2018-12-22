import 'package:kiwi/kiwi.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:mock_reflectly/src/bloc/bloc.export.dart';
import 'package:mock_reflectly/src/resources/remote/api.dart';

part 'injector.g.dart';

abstract class Injector {
  @Register.singleton(AppBLoC)
  @Register.singleton(Api)
  @Register.factory(HomeBLoC)
  @Register.factory(EditStoryBLoC)
  void common();

  static void setup(bool isTest) {
    final injector = _$Injector();
    injector.common();
  }

  static T obtain<T>() {
    return kiwi.Container().resolve<T>();
  }

  static void clear() {
    return kiwi.Container().clear();
  }
}
