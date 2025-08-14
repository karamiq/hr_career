import 'package:app/common_lib.dart';
import 'package:app/src/notification/components/request_card.dart';
import 'package:flutter/material.dart';

class RequestsHistoryPage extends StatelessWidget {
  const RequestsHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ColumnPadded(
        gap: Insets.small,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.pending,
            style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          Column(
            children: [
              RequestCard(
                title: 'Full-Stack Training',
                category: 'Training',
                dateTime: '2024-08-13 11:23 AM',
                status: RequestStatus.pending,
                calendarIconPath: Assets.assetsSvgCalendar,
              ),
              RequestCard(
                title: 'UI/UX Workshop',
                category: 'Design',
                dateTime: '2024-08-15 02:00 PM',
                status: RequestStatus.approved,
                calendarIconPath: Assets.assetsSvgCalendar,
              ),
              RequestCard(
                title: 'Backend Seminar',
                category: 'Development',
                dateTime: '2024-08-20 09:00 AM',
                status: RequestStatus.rejected,
                calendarIconPath: Assets.assetsSvgCalendar,
              ),
            ],
          ),

          Gap(navBarHeight),
        ],
      ),
    );
  }
}
