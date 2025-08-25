import 'package:app/common_lib.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/src/certifications/models/certification_model.dart';
import 'package:app/src/certifications/widgets/certification_tile.dart';
import 'package:app/src/roadmap/widgets/timeline_node.dart';
import 'package:flutter/material.dart';

class CertificationStep {
  final String title;
  final String description;
  final double percent;
  final bool isDone;

  CertificationStep({
    required this.title,
    required this.description,
    required this.percent,
    required this.isDone,
  });
}

class RoadmapCertificationTile extends StatefulWidget {
  final CertificationStep step;
  final bool isLast;

  const RoadmapCertificationTile({super.key, required this.step, this.isLast = false});

  @override
  State<RoadmapCertificationTile> createState() => _RoadmapCertificationTileState();
}

class _RoadmapCertificationTileState extends State<RoadmapCertificationTile> {
  double widgetsHeight = 100.0;
  final GlobalKey _tileKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateHeight();
    });
  }

  void _updateHeight() {
    final RenderBox? renderBox = _tileKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final newHeight = renderBox.size.height;
      if ((newHeight - widgetsHeight).abs() > 5) {
        setState(() {
          widgetsHeight = newHeight;
        });
      }
    }
  }

  void _onTileExpansionChanged() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateHeight();
    });
  }

  @override
  Widget build(BuildContext context) {
    final certificationModel = CertificationModel(
      id: widget.step.title.hashCode.toString(),
      title: widget.step.title,
      issuer: 'Professional Certification',
      expiryDate: DateTime.now(),
      description: widget.step.description,
      imageUrl: 'https://images.credly.com/images/be8fcaeb-c769-4858-b567-ffaaa73ce8cf/image.png',
      completedDate: widget.step.isDone ? DateTime.now() : null,
      skills: _getSkillsForCertification(widget.step.title),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            TimelineNode(isDone: widget.step.isDone),

            if (!widget.isLast)
              AnimatedContainer(
                margin: Insets.extraSmallAll,
                duration: const Duration(milliseconds: 50),
                width: 8,
                height: widgetsHeight - (40),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.onBackground, width: 2),
                  borderRadius: BorderSize.extraSmallRadius,

                  gradient: widget.step.isDone
                      ? ConstantColors.greenVibrant()
                      : ConstantColors.yellowVibrant(),
                ),
              ),
          ],
        ),
        const Gap(Insets.extraSmall),
        Expanded(
          child: NotificationListener<SizeChangedLayoutNotification>(
            onNotification: (notification) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _updateHeight();
              });
              return true;
            },
            child: SizeChangedLayoutNotifier(
              child: CertificationTile(
                key: _tileKey,
                certification: certificationModel,

                onExpand: _onTileExpansionChanged,
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<String> _getSkillsForCertification(String title) {
    if (title.contains('CCNA')) {
      return ['Network Fundamentals', 'Routing & Switching', 'LAN Technologies', 'WAN Technologies'];
    } else if (title.contains('CCNP')) {
      return ['Enterprise Networks', 'Advanced Routing', 'Network Security', 'Troubleshooting'];
    } else if (title.contains('CCIE')) {
      return ['Expert-Level Networking', 'Network Design', 'Complex Troubleshooting', 'Enterprise Solutions'];
    } else if (title.contains('AWS')) {
      return ['Cloud Architecture', 'AWS Services', 'Security', 'Cost Optimization'];
    }
    return ['Professional Skills', 'Technical Expertise', 'Industry Knowledge'];
  }
}
