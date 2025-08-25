import 'package:app/common_lib.dart';
import 'package:app/src/certifications/models/certification_model.dart';
import 'package:app/src/certifications/widgets/certification_image.dart';
import 'package:flutter/material.dart';

class CertificationCardHeader extends StatelessWidget {
  final CertificationModel certification;
  final bool isExpanded;
  final VoidCallback onTap;

  const CertificationCardHeader({
    super.key,
    required this.certification,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = context.theme.textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(Insets.medium),
        child: Row(
          children: [
            CertificationImage(imageUrl: certification.imageUrl),
            const Gap(Insets.medium),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    certification.title,
                    style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(Insets.extraSmall),
                  Text(
                    certification.issuer,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedRotation(
              turns: isExpanded ? 0.5 : 0,
              duration: const Duration(milliseconds: 300),
              child: Icon(Icons.keyboard_arrow_down, color: colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
