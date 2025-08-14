import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';

class RoadmapPage extends ConsumerWidget {
  const RoadmapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: RowPadded(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,

            children: List.generate(11, (index) {
              return Container(
                height: 15,
                width: 15,
                margin: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: context.colorScheme.primary, width: 1),
                ),
              );
            }),
          ),
          const Gap(Insets.medium),
          CertificationCard(),
        ],
      ).withPadding(EdgeInsetsGeometry.only(bottom: Insets.extraLarge * 5)),
    );
  }
}

class CertificationCard extends StatelessWidget {
  const CertificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 100,

          width: 300,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: colorScheme.onPrimary, width: 6),
          ),
          child: Text(
            'Cisco certification national association (CCNA) ',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: colorScheme.onPrimary, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(10, (index) {
            return Container(
              height: 20,
              width: 8,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(color: colorScheme.onPrimary),
            );
          }),
        ),
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color: colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: NetworkImage(
                'https://media.licdn.com/dms/image/v2/C4D22AQEAsX7QOK93pQ/feedshare-shrink_800/feedshare-shrink_800/0/1677540332504?e=2147483647&v=beta&t=qURVcxyBNpmtHsuduVbPO8DRyreMpdn68wFUW3haMME',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
