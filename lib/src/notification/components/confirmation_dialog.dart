import 'package:app/core/network/dio_models.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final VoidCallback? onApprove;

  const ConfirmationDialog({
    super.key,
    this.onApprove,
    required this.title,
    required this.content,
    required this.type,
  });

  final String title;
  final String content;
  final String type;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.only(bottom: Insets.small, right: Insets.small),
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(Insets.extraLarge),
        ),
        child: Container(
          padding: Insets.largeAll,

          decoration: BoxDecoration(
            color: colorScheme.onBackground,
            borderRadius: BorderRadius.circular(Insets.large),
          ),
          child: ColumnPadded(
            gap: Insets.sm,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: colorScheme.onSurface),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.background,
                  borderRadius: BorderSize.smallRadius,
                ),
                child: Text(
                  content,
                  style: TextStyle(color: colorScheme.secondary, fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/svg/category.svg',
                    height: 24,
                    width: 24,
                    color: colorScheme.secondary,
                  ),
                  const SizedBox(width: 8),
                  Text('Road map change', style: TextStyle(fontSize: 16, color: colorScheme.secondary)),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: ConstantColors.green,
                      foregroundColor: colorScheme.onBackground,
                    ),
                    onPressed: onApprove,
                    child: Text(context.l10n.submit),
                  ),
                  const Gap(Insets.medium),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: ConstantColors.red,
                      foregroundColor: colorScheme.onBackground,
                    ),
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(context.l10n.submit),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
