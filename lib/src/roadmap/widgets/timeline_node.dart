import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';
import 'package:app/core/theme/constant_colors.dart';

class TimelineNode extends StatelessWidget {
  final bool isDone;
  const TimelineNode({required this.isDone, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Insets.extraSmall),
      decoration: BoxDecoration(
        borderRadius: BorderSize.extraSmallRadius,
        border: Border.all(color: Theme.of(context).colorScheme.onBackground, width: 2),
        gradient: isDone
            ? ConstantColors.greenVibrant(direction: GradientDirection.vertical)
            : ConstantColors.yellowVibrant(direction: GradientDirection.vertical),
      ),
      child: SvgPicture.asset(
        isDone ? Assets.assetsSvgCheck : Assets.assetsSvgClock,
        color: ConstantColors.white,
        height: 24,
        width: 24,
      ),
    );
  }
}
