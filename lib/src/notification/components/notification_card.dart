import 'package:flutter/material.dart';
import '../../../common_lib.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time; // e.g., "14:35"
  final String iconPath; // SVG asset path

  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Container(
      alignment: Alignment.centerLeft,
      padding: Insets.smallAll,
      decoration: BoxDecoration(
        color: context.colorScheme.onBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Gap(Insets.extraSmall), // Space between top and content
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: context.colorScheme.primary.withOpacity(0.1),
                child: SvgPicture.asset(iconPath, color: context.colorScheme.primary),
              ),
              const SizedBox(width: Insets.medium), // Space between icon and text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    Text(
                      subtitle,
                      style: textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurface),
                    ),
                  ],
                ),
              ),
              Text(time, style: textTheme.labelMedium),
            ],
          ),
        ],
      ).withPadding(Insets.smallAll),
    );
  }
}
