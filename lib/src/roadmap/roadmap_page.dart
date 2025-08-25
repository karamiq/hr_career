import 'package:app/common_lib.dart';
import 'package:app/src/roadmap/widgets/custom_sliver_app_bar.dart';
import 'package:app/src/roadmap/widgets/roadmap_certification_tile.dart';
import 'package:flutter/material.dart';

class RoadmapPage extends StatefulWidget {
  const RoadmapPage({super.key});

  @override
  State<RoadmapPage> createState() => _RoadmapPageState();
}

class _RoadmapPageState extends State<RoadmapPage> {
  final List<CertificationStep> _certSteps = [
    CertificationStep(
      title: 'CCNA (Cisco Certified Network Associate)',
      description:
          'Foundation-level networking certification covering essential network fundamentals and practical skills',
      percent: 1,
      isDone: true,
    ),
    CertificationStep(
      title: 'CCNP Enterprise (Cisco Certified Network Professional)',
      description: 'Professional-level enterprise networking certification for experienced network engineers',
      percent: 1.0,
      isDone: true,
    ),
    CertificationStep(
      title: 'CCIE Enterprise Infrastructure (Expert Level)',
      description:
          'Elite expert-level certification demonstrating mastery of complex enterprise networking solutions',
      percent: 0.5,
      isDone: true,
    ),
    CertificationStep(
      title: 'CCNA (Cisco Certified Network Associate)',
      description:
          'Foundation-level networking certification covering essential network fundamentals and practical skills',
      percent: 1,

      isDone: true,
    ),
    CertificationStep(
      title: 'CCNP Enterprise (Cisco Certified Network Professional)',
      description: 'Professional-level enterprise networking certification for experienced network engineers',
      percent: 1.0,
      isDone: true,
    ),

    CertificationStep(
      title: 'CCIE Enterprise Infrastructure (Expert Level)',
      description:
          'Elite expert-level certification demonstrating mastery of complex enterprise networking solutions',
      percent: 0.5,
      isDone: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverPadding(
            padding: Insets.smallAll,
            sliver: SliverList.builder(
              itemCount: _certSteps.length,
              itemBuilder: (context, index) {
                final step = _certSteps[index];
                final isLast = index == _certSteps.length - 1;
                return RoadmapCertificationTile(step: step, isLast: isLast);
              },
            ),
          ),
          SliverGap(navBarHeight),
        ],
      ),
    );
  }
}
