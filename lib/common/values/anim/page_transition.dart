import 'package:flutter/material.dart';

///页面转场动画
class FadePageTransitionsBuilder extends PageTransitionsBuilder {
  const FadePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return _FadePageTransition(routeAnimation: animation, child: child);
  }
}

class _FadePageTransition extends StatelessWidget {
  _FadePageTransition(
      {Key key, @required Animation<double> routeAnimation, this.child})
      : _opacityAnimation = routeAnimation.drive(_easeInTween),
        super(key: key);

  // static final Tween<Offset> _bottomUpTween = Tween<Offset>(
  //   begin: const Offset(0.0, 0.25),
  //   end: Offset.zero,
  // );
  // static final Animatable<double> _fastOutSlowInTween =
  //     CurveTween(curve: Curves.fastOutSlowIn);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);

  final Animation<double> _opacityAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: child,
    );
  }
}
