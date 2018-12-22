// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void common() {
    final Container container = Container();
    container.registerSingleton((c) => AppBLoC());
    container.registerSingleton((c) => Api());
    container.registerFactory((c) => HomeBLoC());
    container.registerFactory((c) => EditStoryBLoC());
  }
}
