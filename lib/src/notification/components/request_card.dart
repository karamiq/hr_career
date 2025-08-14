import 'package:app/core/network/dio_models.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/src/components/gradient_icon.dart';
import 'package:flutter/material.dart';

enum RequestStatus { pending, approved, rejected }

extension RequestStatusExtension on RequestStatus {
  String get label {
    switch (this) {
      case RequestStatus.pending:
        return 'Pending';
      case RequestStatus.approved:
        return 'Approved';
      case RequestStatus.rejected:
        return 'Rejected';
    }
  }

  Gradient get gradient {
    switch (this) {
      case RequestStatus.pending:
        return ConstantColors.yellowVibrant;
      case RequestStatus.approved:
        return ConstantColors.greenVibrant;
      case RequestStatus.rejected:
        return ConstantColors.redVibrant;
    }
  }
}

class RequestCard extends StatelessWidget {
  final String title;
  final String category;
  final String dateTime;
  final RequestStatus status;
  final String calendarIconPath;

  const RequestCard({
    super.key,
    required this.title,
    required this.category,
    required this.dateTime,
    required this.status,
    required this.calendarIconPath,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Insets.small, horizontal: Insets.medium),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: colorScheme.surfaceContainerHighest,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with title and status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.secondary,
                    ),
                  ),
                ),
                Container(
                  width: 90,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: status.gradient,
                    borderRadius: BorderSize.extraSmallRadius,
                  ),
                  child: Text(
                    status.label,
                    strutStyle: const StrutStyle(forceStrutHeight: true),
                    style: textTheme.labelMedium?.copyWith(
                      color: ConstantColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: Insets.medium),
            // Category & Date row
            Row(
              children: [
                GradientIcon(Assets.assetsSvgCategory),
                const SizedBox(width: Insets.small),
                Text(category, style: textTheme.bodyMedium?.copyWith(color: colorScheme.secondary)),
                const Spacer(),
                GradientIcon(calendarIconPath),
                const SizedBox(width: Insets.small),
                Text(dateTime, style: textTheme.bodyMedium?.copyWith(color: colorScheme.secondary)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
