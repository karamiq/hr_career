import 'package:app/common_lib.dart';
import 'package:app/src/notification/components/request_card.dart';
import 'package:flutter/material.dart';

class RequestsHistoryPage extends StatelessWidget {
  const RequestsHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColumnPadded(
      gap: Insets.small,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.pending,
          style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: 11,
            itemBuilder: (context, index) {
              if (index == 10) {
                return Gap(navBarHeight);
              }
              return RequestCard(
                title: 'Full-Stack Training',
                category: 'Training',
                dateTime: '2024-08-13 11:23 AM',
                status: index % 3 == 1 ? RequestStatus.approved : RequestStatus.rejected,
                calendarIconPath: Assets.assetsSvgCalendar,
              );
            },
            separatorBuilder: (context, index) => const Gap(Insets.medium),
          ),
        ),
      ],
    );
  }
}
