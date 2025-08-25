import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final double labelWidth;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;

  const DetailRow({
    super.key,
    required this.label,
    required this.value,
    this.labelWidth = 100,
    this.labelStyle,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: Insets.small),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              child: Text(
                label,
                style:
                    labelStyle ??
                    textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500, color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: valueStyle ?? textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
