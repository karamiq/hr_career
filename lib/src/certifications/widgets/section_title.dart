import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? iconColor;
  final TextStyle? textStyle;

  const SectionTitle({super.key, required this.title, required this.icon, this.iconColor, this.textStyle});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(icon, size: 18, color: iconColor ?? colorScheme.onSurface),
        const Gap(Insets.small),
        Text(title, style: textStyle ?? textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
