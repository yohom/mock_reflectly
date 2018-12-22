import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:meta/meta.dart';

import '../../di/injector.dart';
import '../../resources/remote/api.dart';

class EditStoryBLoC extends LocalBLoC {
  @visibleForTesting
  static final Api api = Injector.obtain();

  EditStoryBLoC() : super('编辑Story BLoC');

  @override
  List<BaseIO> get ioList => [scrollPage];

  /// letsDoIt
  final scrollPage = IO<int>(seedValue: 0);

  /// how was your day
  final howWasYourDay = IO<double>(seedValue: 0.0);

  /// 选中的make today thing
  final whatMadeToday = IO<String>(seedValue: '');
}
