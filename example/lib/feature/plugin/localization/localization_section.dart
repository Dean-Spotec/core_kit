// Author: Dean.Liu
// DateTime: 2023/04/07 00:00

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../../generated/l10n.dart';
import '../../../route/app_router.dart';

class LocalizationSection extends StatefulWidget {
  const LocalizationSection({super.key});

  @override
  State<LocalizationSection> createState() => _LocalizationSectionState();
}

class _LocalizationSectionState extends State<LocalizationSection> {
  @override
  Widget build(BuildContext context) {
    return CupertinoListSection(
      header: Text(S.of(context).localization),
      children: [
        CupertinoListTile(
          title: Text(S.of(context).localization),
          onTap: () {
            context.pushRoute(const LocalizationRoute());
          },
        ),
      ],
    );
  }
}
