import 'package:flutter/widgets.dart';

import 'theme.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final Theme theme = Theme.of(context);

    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: theme.colors.secondary[900],
        borderRadius: BorderRadius.only(bottomLeft: theme.elbowRadius),
      ),
      padding: EdgeInsets.only(left: theme.rem, bottom: theme.rem * 0.5),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colors.black,
          borderRadius: BorderRadius.only(bottomLeft: theme.elbowRadius),
        ),
        width: double.maxFinite,
        padding: EdgeInsets.all(theme.rem * 0.5),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: theme.rem * 2,
            fontFamily: 'NotoSans',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
