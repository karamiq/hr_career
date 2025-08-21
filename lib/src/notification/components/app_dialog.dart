import 'package:app/core/network/dio_models.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String? content;
  final Widget? icon;
  final List<Widget>? actions;
  final Widget? child;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final Color? dialogColor;
  final double? borderRadius;

  const AppDialog({
    super.key,
    required this.title,
    this.content,
    this.icon,
    this.actions,
    this.child,
    this.contentPadding,
    this.backgroundColor,
    this.dialogColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
        ),
        child: Container(
          padding: const EdgeInsets.only(bottom: Insets.small, right: Insets.small),
          decoration: BoxDecoration(
            gradient: ConstantColors.primaryGradient(),
            borderRadius: BorderRadius.circular(borderRadius ?? Insets.extraLarge),
          ),
          child: Container(
            padding: contentPadding ?? Insets.largeAll,
            decoration: BoxDecoration(
              color: dialogColor ?? colorScheme.onBackground,
              borderRadius: BorderRadius.circular(borderRadius ?? Insets.large),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (icon != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Center(child: icon),
                    ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: colorScheme.onSurface),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  if (content != null)
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 16, bottom: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: backgroundColor ?? colorScheme.background,
                        borderRadius: BorderSize.smallRadius,
                      ),
                      child: Text(
                        content!,
                        style: textTheme.labelLarge?.copyWith(
                          color: (backgroundColor != null)
                              ? textTheme.bodyLarge?.color
                              : colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  if (child != null) Flexible(child: child!),
                  if (actions != null && actions!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: actions!,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
