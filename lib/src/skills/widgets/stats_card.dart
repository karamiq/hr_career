import 'package:app/core/theme/theme_lib.dart';
import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;

  const StatsCard({super.key, required this.value, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: 80,
      width: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ConstantColors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ConstantColors.white.withOpacity(0.2)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: ConstantColors.white, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: ConstantColors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: ConstantColors.white.withOpacity(0.8),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
