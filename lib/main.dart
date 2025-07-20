import 'dart:io';

import 'package:flutter/widgets.dart';

import 'ux/LCARS/colors.dart';
import 'ux/LCARS/header.dart';
import 'ux/LCARS/theme.dart';

void main() {
  setupWindow();
  runApp(const MainApp());
}

void setupWindow() {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    WidgetsFlutterBinding.ensureInitialized();
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: const Color(0xff000000),
      home: Theme(
        colors: ThemeColors(),
        child: const Column(children: <Widget>[Header(title: 'Dashboard')]),
      ),
      pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) => PageRouteBuilder<T>(
        settings: settings,
        pageBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) => builder(context),
      ),
    );
  }
}
