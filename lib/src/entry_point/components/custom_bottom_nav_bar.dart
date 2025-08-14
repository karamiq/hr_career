import 'package:app/common_lib.dart';
import 'package:app/src/components/gradient_icon.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.context,
    required this.getSelectedIndex,
    required this.onItemTapped,
  });

  final BuildContext context;
  final int getSelectedIndex;
  final void Function(int) onItemTapped;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Insets.medium, vertical: Insets.small),
      padding: const EdgeInsets.only(bottom: Insets.extraSmall),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(Insets.medium),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Insets.medium),
        child: BottomNavigationBar(
          backgroundColor: colorScheme.onBackground,
          selectedItemColor: colorScheme.primary,
          unselectedItemColor: colorScheme.onSurface,
          type: BottomNavigationBarType.fixed,

          currentIndex: getSelectedIndex,
          onTap: onItemTapped,
          items: [
            buildComBottomNavigationBarItem(
              context: context,
              label: context.l10n.roadmap,
              icon: Assets.assetsSvgMap,
            ),
            buildComBottomNavigationBarItem(
              context: context,
              label: context.l10n.requests,
              icon: 'assets/svg/request.svg',
            ),
            buildComBottomNavigationBarItem(
              context: context,
              label: context.l10n.profile,
              icon: Assets.assetsSvgProfile,
            ),
          ],
        ),
      ),
    );
  }
}

BottomNavigationBarItem buildComBottomNavigationBarItem({
  required BuildContext context,
  required String label,
  required String icon,
}) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        icon,
        height: 22,
        width: 22,
        colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
      ),
    ),
    label: label,
    tooltip: label,
    activeIcon: Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12.0),
      child: GradientIcon(icon),
    ),
  );
}
