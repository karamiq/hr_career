import 'package:app/common_lib.dart';
import 'package:app/src/certifications/models/certification_model.dart';
import 'package:app/src/certifications/services/certification_service.dart';
import 'package:app/src/certifications/widgets/certification_app_bar.dart';
import 'package:app/src/certifications/widgets/certification_tile.dart';
import 'package:flutter/material.dart';

class CertificationsPage extends StatefulWidget {
  const CertificationsPage({super.key});

  @override
  State<CertificationsPage> createState() => _CertificationsPageState();
}

class _CertificationsPageState extends State<CertificationsPage> {
  List<CertificationModel> get _filteredCertifications {
    return CertificationService.getCompletedCertifications();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: CustomScrollView(
        slivers: [
          CertificationAppBar(
            title: l10n.myCertifications,
            subtitle: l10n.professionalAchievements,
            iconPath: Assets.assetsSvgCirtification,
          ),
          SliverPadding(
            padding: Insets.smallAll,
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                ..._filteredCertifications.map((certification) {
                  return CertificationTile(certification: certification);
                }),
              ]),
            ),
          ),
          SliverGap(navBarHeight),
        ],
      ),
    );
  }
}
