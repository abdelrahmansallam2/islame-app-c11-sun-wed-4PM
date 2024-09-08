import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:islame_app/app_colors.dart';
import 'package:islame_app/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<String> languageslist = ['English', 'عربي'];
  List<String> themelist = [
    'Light',
    'Dark',
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              'Languge',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: provider.isDark()
                      ? AppColors.white
                      : AppColorsdark.blackcolor),
            ),
            SizedBox(
              height: 20,
            ),
            CustomDropdown<String>(
              hintText: 'Select Your Language',
              items: languageslist,
              initialItem: provider.currentlanguge == 'en'
                  ? languageslist[0]
                  : languageslist[1],
              onChanged: (value) {
                if (value == 'English') {
                  provider.changeLanguageCode('en');
                }
                if (value == 'عربي') {
                  provider.changeLanguageCode('ar');
                }
                log('changing value to: $value');
              },
              decoration: CustomDropdownDecoration(
                closedFillColor: provider.isDark()
                    ? Color(0xff141A2E).withOpacity(.85)
                    : Color(0xffB7935F).withOpacity(.85),
                expandedFillColor: provider.isDark()
                    ? Color(0xff141A2E).withOpacity(.85)
                    : Color(0xffB7935F).withOpacity(.85),
                closedSuffixIcon: Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: provider.isDark()
                      ? AppColorsdark.whitecolor
                      : AppColors.blackcolor,
                ),
                expandedSuffixIcon: Icon(
                  Icons.keyboard_arrow_up_sharp,
                  color: provider.isDark()
                      ? AppColorsdark.whitecolor
                      : AppColors.blackcolor,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Them Mode',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: provider.isDark()
                      ? AppColors.white
                      : AppColorsdark.blackcolor),
            ),
            SizedBox(
              height: 20,
            ),
            CustomDropdown<String>(
              hintText: 'Select Your Language',
              items: themelist,
              initialItem: provider.currentthemmode == ThemeMode.dark
                  ? themelist[1]
                  : themelist[0],
              onChanged: (value) {
                if (value == 'Dark') {
                  provider.changeThemMode(ThemeMode.dark);
                }
                if (value == 'Light') {
                  provider.changeThemMode(ThemeMode.light);
                }

                log('changing value to: $value');
              },
              decoration: CustomDropdownDecoration(
                closedFillColor: provider.isDark()
                    ? Color(0xff141A2E).withOpacity(.85)
                    : Color(0xffB7935F).withOpacity(.85),
                expandedFillColor: provider.isDark()
                    ? Color(0xff141A2E).withOpacity(.85)
                    : Color(0xffB7935F).withOpacity(.85),
                closedSuffixIcon: Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: provider.isDark()
                      ? AppColorsdark.whitecolor
                      : AppColors.blackcolor,
                ),
                expandedSuffixIcon: Icon(
                  Icons.keyboard_arrow_up_sharp,
                  color: provider.isDark()
                      ? AppColorsdark.whitecolor
                      : AppColors.blackcolor,
                ),
              ),
            )
          ],
        ));
  }
}
