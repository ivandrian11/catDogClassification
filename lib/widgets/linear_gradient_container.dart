import 'package:cat_dog_clf/common/theme.dart';
import 'package:flutter/material.dart';

class LinearGradientContainer extends StatelessWidget {
  final Widget child;

  LinearGradientContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: gradientBackground,
      ),
    );
  }
}
