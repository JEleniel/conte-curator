import 'package:flutter/widgets.dart';

import 'colors.dart';

class Theme extends InheritedWidget {
  factory Theme({Key? key, ThemeColors? colors, double? rem, required Widget child}) {
    return Theme._create(key: key, colors: colors ?? ThemeColors(), rem: rem ?? 10.0, child: child);
  }
  const Theme._create({super.key, required this.colors, required this.rem, required super.child});

  final ThemeColors colors;
  final double rem;

  Radius get elbowRadius => Radius.circular(rem * 3);

  static Theme? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Theme>();
  }

  static Theme of(BuildContext context) {
    final Theme? result = maybeOf(context);
    assert(result != null, 'No Theme found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Theme oldWidget) => colors != oldWidget.colors;
}
