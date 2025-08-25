import 'package:flutter/material.dart';

class AnimatedExpansionContainer extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  final Color? backgroundColor;
  final Border? border;

  const AnimatedExpansionContainer({
    super.key,
    required this.child,
    required this.animation,
    this.backgroundColor,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: border ?? Border(top: BorderSide(color: colorScheme.outline.withOpacity(0.2))),
        ),
        child: child,
      ),
    );
  }
}
