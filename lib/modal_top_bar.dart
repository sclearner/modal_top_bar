import 'package:flutter/material.dart';

Future<T?> showModalTopSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
}) async {
  return await Navigator.push(context, ModalTopBarRoute(builder: builder));
}

class ModalTopBarRoute<T> extends ModalRoute<T> {
  final WidgetBuilder builder;
  ModalTopBarRoute({required this.builder});

  @override
  Color? get barrierColor => Colors.black.withAlpha(100);

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => kThemeAnimationDuration;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: Align(
        alignment: Alignment.topCenter,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(kRadialReactionRadius),
            ),
          ),
          child: Builder(builder: builder),
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -1),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
