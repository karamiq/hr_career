import 'package:app/core/network/dio_models.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'timeline_node.dart';
import 'package:app/core/theme/constant_colors.dart';

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

class CertificationCard extends StatefulWidget {
  final CertificationStep step;
  final bool isLast;
  const CertificationCard({required this.step, required this.isLast, super.key});

  @override
  State<CertificationCard> createState() => _CertificationCardState();
}

class _CertificationCardState extends State<CertificationCard> {
  final key = const Key('certification_card');
  bool _expanded = false;
  double _widgetHeight = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = context.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        _onCardSizeChanged(renderBox.size);
      }
    });
  }

  void _onCardSizeChanged(Size size) {
    if (mounted && (size.height - _widgetHeight).abs() > 5) {
      setState(() {
        _widgetHeight = size.height;
      });
    }
  }

  void _toggleExpanded() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!widget.isLast)
          Column(
            children: [
              TimelineNode(isDone: widget.step.isDone, isLast: false),
              SizedBox(height: Insets.small),
              Container(
                key: key,
                height: _widgetHeight,
                width: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderSize.extraLargeRadius,
                  border: Border.all(color: colorScheme.onBackground, width: 1.5),
                  gradient: widget.step.isDone
                      ? ConstantColors.greenVibrant(direction: GradientDirection.vertical)
                      : ConstantColors.yellowVibrant(direction: GradientDirection.vertical),
                ),
              ),
              SizedBox(height: Insets.small),
            ],
          ),
        SizedBox(width: Insets.small),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return NotificationListener<SizeChangedLayoutNotification>(
                onNotification: (notification) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    final renderBox = context.findRenderObject() as RenderBox?;
                    if (renderBox != null) {
                      _onCardSizeChanged(renderBox.size);
                    }
                  });
                  return true;
                },
                child: SizeChangedLayoutNotifier(
                  child: AnimatedContainer(
                    duration: Time.small,
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.all(Insets.sm),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Header (title, description, percent bar)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.step.title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: colorScheme.onSurface,
                                        ),
                                      ),
                                      SizedBox(height: Insets.extraSmall),
                                      Text(
                                        widget.step.description,
                                        style: TextStyle(
                                          color: colorScheme.onSurface.withOpacity(0.7),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(2),
                                IconButton(
                                  onPressed: _toggleExpanded,
                                  style: IconButton.styleFrom(
                                    foregroundColor: context.colorScheme.background,
                                    shape: RoundedRectangleBorder(borderRadius: BorderSize.extraSmallRadius),
                                    backgroundColor: colorScheme.secondary,
                                  ),
                                  icon: AnimatedRotation(
                                    duration: Time.small,
                                    curve: Curves.easeInOut,
                                    turns: _expanded ? .5 : 0, // 90 degrees for
                                    child: Icon(Icons.keyboard_arrow_down_rounded),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Insets.medium),
                            Stack(
                              children: [
                                Container(
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: colorScheme.surfaceVariant,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: widget.step.isDone
                                        ? [
                                            BoxShadow(
                                              color: ConstantColors.green,
                                              blurRadius: 3,
                                              spreadRadius: 1,
                                            ),
                                          ]
                                        : [],
                                  ),
                                ),
                                FractionallySizedBox(
                                  widthFactor: widget.step.percent,
                                  child: Container(
                                    height: 8,
                                    decoration: BoxDecoration(
                                      gradient: widget.step.isDone
                                          ? ConstantColors.greenVibrant()
                                          : ConstantColors.yellowVibrant(),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Insets.extraSmall),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return (widget.step.isDone
                                            ? ConstantColors.greenVibrant()
                                            : ConstantColors.yellowVibrant())
                                        .createShader(bounds);
                                  },
                                  child: Text(
                                    '${(widget.step.percent * 100).toInt()}%',
                                    style: const TextStyle(
                                      color: ConstantColors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Expanded content
                            AnimatedCrossFade(
                              firstChild: SizedBox.shrink(),
                              secondChild: Container(
                                height: 400,
                                padding: EdgeInsets.only(top: Insets.medium),
                                child: Text(
                                  'Expanded details go here.',
                                  style: TextStyle(fontSize: 14, color: colorScheme.onSurface),
                                ),
                              ),
                              crossFadeState: _expanded
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              duration: Time.small,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
