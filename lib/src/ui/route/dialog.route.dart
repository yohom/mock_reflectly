import 'dart:async';

import 'package:flutter/material.dart';

class DialogRoute<T> extends PopupRoute<T> {
  DialogRoute({
    @required this.theme,
    bool barrierDismissible = true,
    this.barrierLabel,
    @required this.child,
    RouteSettings settings,
  })  : assert(barrierDismissible != null),
        _barrierDismissible = barrierDismissible,
        super(settings: settings);

  final Widget child;
  final ThemeData theme;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 150);

  @override
  bool get barrierDismissible => _barrierDismissible;
  final bool _barrierDismissible;

  @override
  Color get barrierColor => Colors.black12;

  @override
  final String barrierLabel;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return SafeArea(
      child: Builder(builder: (BuildContext context) {
        final Widget annotatedChild = Semantics(
          child: child,
          scopesRoute: true,
          explicitChildNodes: true,
        );
        return theme != null
            ? Theme(data: theme, child: annotatedChild)
            : annotatedChild;
      }),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
        child: child);
  }
}

Future<T> showLightDialog<T>({
  @required
      BuildContext context,
  bool barrierDismissible = true,
  @Deprecated(
      'Instead of using the "child" argument, return the child from a closure '
      'provided to the "builder" argument. This will ensure that the BuildContext '
      'is appropriate for widgets built in the dialog.')
      Widget child,
  WidgetBuilder builder,
}) {
  assert(child == null || builder == null);
  return Navigator.of(context, rootNavigator: true).push(DialogRoute<T>(
        child: child ?? Builder(builder: builder),
        theme: Theme.of(context, shadowThemeOnly: true),
        barrierDismissible: barrierDismissible,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
      ));
}
