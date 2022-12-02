import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  CustomPageRoute(
      {required this.child,
      this.type = TransitionType.bottom,
      this.slideDirection = AxisDirection.right,
      this.scaleAlignment = Alignment.center})
      : super(
          transitionDuration: kThemeAnimationDuration,
          reverseTransitionDuration: kThemeAnimationDuration,
          pageBuilder: (context, firstAnimation, secondAnimation) => child,
        );

  final Widget child;
  final TransitionType type;
  final AxisDirection slideDirection;
  final Alignment scaleAlignment;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (type == TransitionType.scale) {
      return ScaleTransition(
        scale: animation,
        alignment: scaleAlignment,
        child: child,
      );
    } else {
      return SlideTransition(
        position: Tween<Offset>(
          begin: _getBeginOffset(),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    }
  }

  Offset _getBeginOffset() {
    switch (slideDirection) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.left:
        return const Offset(1, 0);
    }
  }
}

enum TransitionType { scale, left, right, top, bottom }
