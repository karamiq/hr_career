import 'package:app/core/network/dio_models.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FilledLoadingButton extends StatelessWidget {
  const FilledLoadingButton({
    super.key,
    required this.isLoading,
    required this.child,
    required this.onPressed,
  });

  final bool isLoading;
  final Widget child;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: isLoading ? Colors.grey : Theme.of(context).colorScheme.primary,
        borderRadius: BorderSize.extraSmallRadius,
        gradient: isLoading ? null : ConstantColors.primaryGradient(),
      ),
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: ConstantColors.white,
        ),
        onPressed: isLoading ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [isLoading ? const CircularProgressIndicator() : child],
        ),
      ),
    );
  }
}
