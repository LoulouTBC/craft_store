import 'package:flutter/material.dart';

class AnimationRoute extends PageRouteBuilder {
  final page;
  AnimationRoute({required this.page})
      : super(
          transitionDuration: const Duration(seconds: 1),
          pageBuilder: (context, animation, animation2) => page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> animation2,
            Widget child,
          ) {
            return ScaleTransition(
              scale: animation,
              child: child
              ,
            );
          },
        );
}
