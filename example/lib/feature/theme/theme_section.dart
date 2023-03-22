// Author: Dean.Liu
// DateTime: 2023/04/03 18:29

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';

import '../../common/theme/ex_theme.dart';

class ThemeSection extends StatefulWidget {
  const ThemeSection({super.key});

  @override
  State<ThemeSection> createState() => _ThemeSectionState();
}

class _ThemeSectionState extends State<ThemeSection> {
  @override
  Widget build(BuildContext context) {
    return CupertinoListSection(
      header: Text(
        '主题',
        style: ExTheme.of(context).sectionTitle,
      ),
      children: [
        CupertinoListTile(
          title: const Text('选择主题'),
          trailing: SizedBox(
            width: 180,
            child: CupertinoSegmentedControl<AdaptiveThemeMode>(
              groupValue: CupertinoAdaptiveTheme.of(context).mode,
              children: const {
                AdaptiveThemeMode.light: Text('浅色模式'),
                AdaptiveThemeMode.dark: Text('深色模式'),
              },
              onValueChanged: (model) {
                setState(() {
                  CupertinoAdaptiveTheme.of(context).setThemeMode(model);
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
