import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islame_app/hadeth/hadeth_tab.dart';
import 'package:islame_app/quran/quran_tab.dart';
import 'package:islame_app/radio/radio_tab.dart';
import 'package:islame_app/sebha/sebha_tab.dart';
import 'package:islame_app/settings/settings_tab.dart';
import 'package:provider/provider.dart';

import '../settings_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homescreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.getHomeBackGround(),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_tittle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).canvasColor),
            child: BottomNavigationBar(
              currentIndex: selectedindex,
              onTap: (index) {
                selectedindex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon:
                        ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                    label: AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                    label: AppLocalizations.of(context)!.sebha),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings),
              ],
            ),
          ),
          body: tabs[selectedindex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    Qurantab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab()
  ];
}
