import 'package:app/core/network/dio_models.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class RequestDetailsDialog extends StatelessWidget {
  final VoidCallback? onApprove;

  const RequestDetailsDialog({
    super.key,
    this.onApprove,
    required this.title,
    required this.content,
    required this.data,
    required this.type,
  });

  final String title;
  final String content;
  final DateTime data;
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
          padding: Insets.mediumAll,

          decoration: BoxDecoration(
            color: colorScheme.onBackground,
            borderRadius: BorderRadius.circular(Insets.large),
          ),
          child: ColumnPadded(
            gap: Insets.sm,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: ClipRRect(
                  borderRadius: BorderSize.extraLargeRadius,
                  child: Material(
                    color: ConstantColors.red,
                    child: InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
                        child: Icon(Icons.close, color: ConstantColors.white, size: 28),
                      ),
                    ),
                  ),
                ),
              ),

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
                children: [
                  SvgPicture.asset(
                    'assets/svg/calendar.svg',
                    height: 24,
                    width: 24,
                    color: colorScheme.secondary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    data.toYearMonthDayTimeFormat(),
                    style: TextStyle(fontSize: 16, color: colorScheme.secondary),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7CB342),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: GestureDetector(
                      onTap: onApprove,
                      child: const Text(
                        'Approved',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
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
