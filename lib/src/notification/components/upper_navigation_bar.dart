import 'package:app/core/theme/theme_lib.dart';
import 'package:app/src/components/custom_animation_builder.dart';
import 'package:app/src/notification/components/upper_navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:app/common_lib.dart';

class UpperNavigationBar extends StatefulWidget {
  const UpperNavigationBar({
    required this.tabs,
    required this.selectedIndex,
    required this.onTabChanged,
    super.key,
  });

  final List<UpperNavigationBarButton> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  @override
  State<UpperNavigationBar> createState() => _UpperNavigationBarState();
}

class _UpperNavigationBarState extends State<UpperNavigationBar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return CustomAnimationBuilder(
      duration: Duration(milliseconds: 200),
      builder: (scaleAnimation) {
        return Transform.scale(
          scale: scaleAnimation.value,
          child: Container(
            alignment: Alignment.center,
            padding: Insets.smallAll,
            decoration: BoxDecoration(
              color: context.colorScheme.onBackground,
              borderRadius: BorderRadius.circular(20),
            ),
            child: RowPadded(
              gap: Insets.small,
              children: [
                for (int i = 0; i < widget.tabs.length; i++)
                  Expanded(child: _buildTabButton(widget.tabs[i], i)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTabButton(UpperNavigationBarButton tab, int index) {
    final colorScheme = Theme.of(context).colorScheme;
    bool isSelected = widget.selectedIndex == index;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderSize.smallRadius,
        onTap: () => widget.onTabChanged(index),
        child: AnimatedContainer(
          alignment: Alignment.center,

          transformAlignment: Alignment.center,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOutCubic,

          decoration: BoxDecoration(
            gradient: isSelected ? ConstantColors.primaryGradient() : null,
            borderRadius: BorderRadius.circular(16),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (tab.icon != null)
                  AnimatedContainer(
                    transformAlignment: Alignment.center,
                    alignment: Alignment.center,
                    duration: Duration(milliseconds: 300),
                    transform: Matrix4.identity()..scale(isSelected ? 1.2 : 1.0),
                    child: Container(
                      padding: Insets.smallAll,
                      decoration: isSelected
                          ? BoxDecoration(
                              color: context.colorScheme.onPrimary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            )
                          : null,
                      child: SvgPicture.asset(
                        tab.icon!,
                        width: isSelected ? 24 : 22,
                        height: isSelected ? 24 : 22,
                        fit: BoxFit.contain,
                        colorFilter: ColorFilter.mode(
                          isSelected ? colorScheme.onPrimary : colorScheme.onSurface.withOpacity(0.6),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 300),
                  style: TextStyle(
                    fontFamily: context.textTheme.bodyMedium?.fontFamily,
                    color: isSelected ? colorScheme.surface : colorScheme.onSurface.withOpacity(0.6),
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    fontSize: isSelected ? 13 : 12,
                  ),
                  child: Padding(
                    padding: Insets.smAll,
                    child: Text(
                      tab.label,
                      textAlign: TextAlign.center,

                      style: TextStyle(
                        fontSize: 20,
                        color: isSelected ? ConstantColors.white : colorScheme.onSurface.withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
