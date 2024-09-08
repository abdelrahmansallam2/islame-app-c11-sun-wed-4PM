import 'package:flutter/material.dart';
import 'package:islame_app/app_colors.dart';
import 'package:islame_app/settings_provider.dart';
import 'package:provider/provider.dart';

import 'quran_tab.dart';

class ItemSuraName extends StatelessWidget {
  final SuraData data;

  ItemSuraName({required this.data});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Row(
      children: [
        Expanded(
            child: Text(
          data.suraNumber,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: provider.isDark()
                  ? AppColorsdark.whitecolor
                  : AppColors.blackcolor),
        )),
        SizedBox(
          height: 40,
          child: VerticalDivider(
            color: Theme.of(context).dividerTheme.color,
            thickness: 2,
          ),
        ),
        Expanded(
            child: Text(
          data.suraName,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: provider.isDark()
                  ? AppColorsdark.whitecolor
                  : AppColors.blackcolor),
        )),
      ],
    );
  }
}
