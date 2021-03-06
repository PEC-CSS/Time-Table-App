import 'package:flutter/material.dart';


class CustomPopupRoute<T> extends PageRoute<T>{
  CustomPopupRoute({
    required WidgetBuilder builder,
    RouteSettings settings = const RouteSettings(),
    bool fullscreenDialog = false,
  })  : _builder = builder,
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder _builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  String get barrierLabel => "Popup dialog open";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation){
    return _builder(context);
  }
}