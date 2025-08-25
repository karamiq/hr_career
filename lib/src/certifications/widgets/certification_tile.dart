import 'package:app/core/utils/constants/sizes.dart';
import 'package:app/src/certifications/models/certification_model.dart';
import 'package:app/src/certifications/widgets/certification_card_header.dart';
import 'package:app/src/certifications/widgets/certification_expanded_content.dart';
import 'package:flutter/material.dart';

class CertificationTile extends StatefulWidget {
  final CertificationModel certification;
  final void Function()? onExpand;
  const CertificationTile({super.key, required this.certification, this.onExpand});

  @override
  State<CertificationTile> createState() => _CertificationTileState();
}

class _CertificationTileState extends State<CertificationTile> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _expandAnimation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      widget.onExpand?.call();
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: Insets.medium),
      decoration: BoxDecoration(color: colorScheme.surface, borderRadius: BorderSize.smallRadius),
      child: Column(
        children: [
          CertificationCardHeader(
            certification: widget.certification,
            isExpanded: _isExpanded,
            onTap: _toggleExpanded,
          ),
          CertificationExpandedContent(certification: widget.certification, animation: _expandAnimation),
        ],
      ),
    );
  }
}
