import 'package:app/common_lib.dart';
import 'package:app/core/providers/settings_provider.dart';
import 'package:app/src/certifications/models/certification_model.dart';
import 'package:app/src/certifications/widgets/animated_expansion_container.dart';
import 'package:app/src/certifications/widgets/detail_row.dart';
import 'package:app/src/certifications/widgets/section_title.dart';
import 'package:app/src/certifications/widgets/vibrant_skill_chip_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CertificationExpandedContent extends ConsumerWidget {
  final CertificationModel certification;
  final Animation<double> animation;

  const CertificationExpandedContent({super.key, required this.certification, required this.animation});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = ref.read(settingsProvider).localeCode;
    return AnimatedExpansionContainer(
      animation: animation,
      child: Padding(
        padding: const EdgeInsets.all(Insets.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: context.l10n.aboutThisCertification, icon: Icons.info_outline),
            const Gap(Insets.small),
            Text(
              certification.description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
            ),
            const Gap(Insets.large),

            // Skills section
            SectionTitle(title: context.l10n.skillsCovered, icon: Icons.psychology),
            const Gap(Insets.small),
            VibrantSkillChipList(
              skills: certification.skills,
              spacing: Insets.small,
              runSpacing: Insets.small,
            ),
            const Gap(Insets.large),

            // Certification details section
            SectionTitle(title: context.l10n.certificationDetails, icon: Icons.badge),
            const Gap(Insets.small),
            if (certification.completedDate != null)
              DetailRow(
                label: context.l10n.completionDate,
                value: DateFormat('MMMM dd, yyyy', local).format(certification.completedDate!),
              ),
            if (certification.expiryDate != null)
              DetailRow(
                label: context.l10n.expiryDate,
                value: DateFormat('MMMM dd, yyyy', local).format(certification.expiryDate!),
              ),
          ],
        ),
      ),
    );
  }
}
